-- Set Leader Key
vim.g.mapleader = ' '
-- Auto-install packer if not present
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Basic Configuration
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.cmd('syntax on')
vim.opt.termguicolors = true
vim.opt.swapfile = false
vim.opt.clipboard = 'unnamedplus'
vim.opt.cursorline = true

-- Plugin management
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- File explorer
  use 'kyazdani42/nvim-tree.lua'
require('nvim-tree').setup {}
  use 'nvim-tree/nvim-web-devicons'

  -- LSP and Autocomplete
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'

  -- Syntax highlighting and treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update, { with_sync = true })
    end
  }

  use 'nvim-lua/plenary.nvim'

  -- Auto Formatter
  use 'sbdchd/neoformat'

  -- Fuzzy finder
  use {
	'nvim-telescope/telescope.nvim',
	requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- Automatically set up configuration after cloning packer.nvim
  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- Keymaps for NvimTree
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>r', ':NvimTreeRefresh<CR>', { noremap = true, silent = true })  -- Refresh file explorer
vim.api.nvim_set_keymap('n', '<leader>n', ':NvimTreeFindFile<CR>', { noremap = true, silent = true }) -- Find current file in explorer

-- General Keymaps
vim.api.nvim_set_keymap('n', '<leader>w', '<:w<CR>', { noremap = true, silent = true }) -- save file
vim.api.nvim_set_keymap('n', '<leader>q', '<:q!<CR>', { noremap = true, silent = true }) -- quit file


-- Telescope (Fuzzy Finder)
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true }) -- Find files
vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<CR>', { noremap = true, silent = true })  -- Grep in project
vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope buffers<CR>', { noremap = true, silent = true })    -- List open buffers
vim.api.nvim_set_keymap('n', '<leader>fh', ':Telescope help_tags<CR>', { noremap = true, silent = true })  -- Find help

-- Autocomplete (using nvim-cmp)
vim.api.nvim_set_keymap('i', '<C-Space>', 'cmp#complete()', { noremap = true, silent = true, expr = true }) -- Trigger completion

-- Neoformat keybinding
vim.api.nvim_set_keymap('n', '<leader>fo', ':Neoformat<CR>', { noremap = true, silent = true })

-- Configure Neoformat for Python with black
vim.g.neoformat_python_black = {
    exe = '/home/sanity/.local/bin/black',
    args = {'--fast', '-'},  -- Use '--fast' for quicker formatting; '-' to read from stdin
    stdin = 1
}

-- Enable black as the default formatter for Python
vim.g.neoformat_enabled_python = {'black'}

-- Automatically format Python files before saving
vim.cmd([[autocmd BufWritePre *.py Neoformat]])

