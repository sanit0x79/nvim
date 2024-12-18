# Gruvbox Light Theme Setup for Neovim with Packer

This guide helps you set up the **Gruvbox** light theme in Neovim using **Packer**.

## Requirements

- Neovim 0.5+
- [Packer](https://github.com/wbthomason/packer.nvim) as your plugin manager
- A terminal with true color support

## Installation

1. Add the following to your `plugins.lua` (or equivalent plugin configuration file):
   ```lua
   use {
     'morhetz/gruvbox',
     config = function()
       -- Enable Gruvbox Light mode
       vim.o.background = "light"
       vim.o.termguicolors = true
       vim.cmd("colorscheme gruvbox")
     end
   }


# Neovim Configuration with Packer.nvim

This repository contains a fully configured Neovim setup designed for productivity and ease of use. It leverages powerful plugins for file exploration, fuzzy searching, syntax highlighting, code formatting, and Markdown previewing, all managed through [packer.nvim](https://github.com/wbthomason/packer.nvim).

## Features

- **Plugin Management**: Efficiently manage plugins using `packer.nvim`.
- **File Explorer**: Navigate your filesystem with `nvim-tree` and file icons.
- **LSP and Autocompletion**: Robust coding support with `nvim-lspconfig` and `nvim-cmp`.
- **Syntax Highlighting**: Enhanced syntax support via Treesitter.
- **Markdown Preview**: Real-time Markdown rendering with `markdown-preview.nvim`.
- **Code Formatting**: Auto-formatting for Python (using `black`) and other languages via `neoformat`.
- **Fuzzy Finder**: Powerful file and text search capabilities with `telescope.nvim`.
- **Custom Keybindings**: Simplified navigation and efficient commands.

---

## Installation Guide

### Prerequisites

Before proceeding, ensure the following are installed on your system:
1. **Neovim**: Version 0.5 or higher is required. Install from [Neovim's website](https://neovim.io/).
2. **Git**: Necessary for cloning repositories.
3. **Node.js**: Needed for `markdown-preview.nvim`. You can install it using [Node.js](https://nodejs.org/).

### Steps to Set Up

1. **Clone the Configuration**  
   Clone this repository into your Neovim configuration directory:
   ```bash
   git clone https://github.com/sanit0x79/nvim.git ~/.config/nvim
   ```
   ```bash
   git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
   ```

