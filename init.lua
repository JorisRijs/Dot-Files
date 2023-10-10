-- Keybindings

-- Set runtimepath to include plugin directory
vim.o.runtimepath = vim.o.runtimepath .. ',~/.vim/plugged/*'

-- Set packpath for Neovim to look for plugins
vim.o.packpath = '~/.vim/plugged'

-- Disable compatibility to old-time vi
vim.o.nocompatible = true

-- Show matching brackets
vim.o.showmatch = true

-- Case insensitive matching
vim.o.ignorecase = true

-- Middle-click paste with mouse
vim.o.mouse = "v"

-- Highlight search results
vim.o.hlsearch = true

-- Indent a new line the same amount as the line just typed
vim.o.autoindent = true

-- Add line numbers
vim.o.number = true

-- Get bash-like tab completions
vim.o.wildmode = "longest,list"

-- Set color columns for good coding style
vim.o.cc = "88"

-- Allow auto-indenting depending on file type
vim.cmd('filetype plugin indent on')

-- Number of columns occupied by a tab character
vim.o.tabstop = 4

-- Convert tabs to white space
vim.o.expandtab = true

-- Width for autoindents
vim.o.shiftwidth = 4

-- See multiple spaces as tabstops so <BS> does the right thing
vim.o.softtabstop = 4

-- Enable syntax highlighting
vim.cmd('syntax on')

-- Plug configuration
vim.fn['plug#begin']()

vim.fn['plug#']( 'tpope/vim-sensible' )
vim.fn['plug#']( 'nvim-tree/nvim-web-devicons' )
vim.fn['plug#']( 'nvim-tree/nvim-tree.lua' )
vim.fn['plug#']( 'catppuccin/nvim', { ['as'] = 'catppuccin' } )

vim.fn['plug#end']()

-- Set colorscheme
vim.cmd.colorscheme "catppuccin"

vim.o.nocompatible = true
vim.o.showmatch = true
vim.o.ignorecase = true
vim.o.mouse = v

vim.wo.relativenumber=true 

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})


