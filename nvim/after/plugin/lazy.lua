local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
   'tpope/vim-fugitive',
   'tpope/vim-rhubarb',
   'tpope/vim-sleuth',
   {
       'nvim-telescope/telescope.nvim',
       tag = '0.1.4',
       dependencies = {
	    'nvim-lua/plenary.nvim',
	    "nvim-telescope/telescope-live-grep-args.nvim"
       },
        config = function()
            require("telescope").load_extension("live_grep_args")
        end,
   },
   {
       'nvim-treesitter/nvim-treesitter',
       cmd = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
   },
   {
	'nvim-lualine/lualine.nvim',
	dependencies = {'nvim-tree/nvim-web-devicons', opt = true},
   },
   {'catppuccin/nvim', name = 'catppuccin'},

   'nvim-tree/nvim-tree.lua',
   'nvim-tree/nvim-web-devicons',
   'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
   'romgrk/barbar.nvim',
   'mbbill/undotree',
   {
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v3.x',
	dependencies = {
            --- Uncomment these if you want to manage LSP servers from neovim
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            -- LSP Support
            'neovim/nvim-lspconfig',
            -- Autocompletion
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-nvim-lsp',
            'L3MON4D3/LuaSnip',
            -- Snippet Engine & its associated nvim-cmp source
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            -- Adds a number of user-friendly snippets
            'rafamadriz/friendly-snippets',
	},
   },
   {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
   },

}

local opts = {}

require("lazy").setup(plugins, opts)
