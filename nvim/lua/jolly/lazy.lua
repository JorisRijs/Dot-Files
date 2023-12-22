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
	    "nvim-telescope/telescope-live-grep-args.nvim",
            "folke/todo-comments.nvim",
       },
        config = function()
            require("telescope").load_extension("live_grep_args")
        end,
   },
   {
       'nvim-treesitter/nvim-treesitter',
       --cmd = function()
       --     local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
       --     ts_update()
       -- end,
   },
   {
	'nvim-lualine/lualine.nvim',
	dependencies = {'nvim-tree/nvim-web-devicons', opt = true},
   },
   {'catppuccin/nvim', name = 'catppuccin', lazy=true},
   { "folke/tokyonight.nvim", lazy = false, priority = 1000,opts = {} },

   'nvim-tree/nvim-tree.lua',
   'nvim-tree/nvim-web-devicons',
   'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
   'romgrk/barbar.nvim',
   'mbbill/undotree',
   {'akinsho/toggleterm.nvim', version = "*", config = true},
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
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            -- Snippet Engine & its associated nvim-cmp source
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            -- Adds a number of user-friendly snippets
            'rafamadriz/friendly-snippets',
	},
   },
   -- Debugging plugins
   'mfussenegger/nvim-dap',
   'mfussenegger/nvim-dap-python',
   'rcarriga/nvim-dap-ui',

   -- FIXME: add correct config 
    {
    'numToStr/Comment.nvim', opts = {}, lazy = false,
   },
    {
      {'akinsho/toggleterm.nvim', version = "*", config = true}
    },
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
      end,
    }

}

local opts = {}

require("lazy").setup(plugins, opts)
