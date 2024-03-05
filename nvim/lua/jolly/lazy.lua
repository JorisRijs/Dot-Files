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
   'folke/neodev.nvim',
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
       -- cmd = function()
       --     local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
       --     ts_update()
       -- end,
   },

   -- UI related plugins
   {
	'nvim-lualine/lualine.nvim',
	dependencies = {'nvim-tree/nvim-web-devicons', opt = true},
   },
   {'catppuccin/nvim', name = 'catppuccin', lazy=false},
   { "folke/tokyonight.nvim", lazy = false, priority = 1000,opts = {} },
   'romgrk/barbar.nvim',
   'levouh/tint.nvim',
   'nvim-tree/nvim-tree.lua',
   'nvim-tree/nvim-web-devicons',
   -- lazy.nvim
    {
      "folke/noice.nvim",
      event = "VeryLazy",
      dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        "rcarriga/nvim-notify",
        }
    },
    {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        -- config
      }
    end, dependencies = { {'nvim-tree/nvim-web-devicons'}}
    },
    {'glepnir/dbsession.nvim', cmd = { 'SessionSave', 'SessionDelete', 'SessionLoad'},
      opts = {}
    },

   'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
   'mbbill/undotree',
   {
    'cameron-wags/rainbow_csv.nvim',
    config = true,
    ft = {
        'csv',
        'tsv',
        'csv_semicolon',
        'csv_whitespace',
        'csv_pipe',
        'rfc_csv',
        'rfc_semicolon'
    },
    cmd = {
        'RainbowDelim',
        'RainbowDelimSimple',
        'RainbowDelimQuoted',
        'RainbowMultiDelim'
    }
   },
   {'akinsho/toggleterm.nvim', version = "*", config = true},
   {
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v3.x',
	dependencies = {
            --- Uncomment these if you want to manage LSP servers from neovim
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

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
   {
    -- LSP Support
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'folke/neoconf.nvim', cmd = 'Neoconf', config = true },
      'rafi/neoconf-venom.nvim',
    },
   },
    {
      'rafi/neoconf-venom.nvim',
      dependencies = { 'nvim-lua/plenary.nvim', 'folke/neoconf.nvim' },
    },
   -- Debugging plugins
   'mfussenegger/nvim-dap',
   'mfussenegger/nvim-dap-python',
   'rcarriga/nvim-dap-ui',

    {'numToStr/Comment.nvim', opts = {}, lazy = false,},

    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
      end,
    },

    -- Navigation related plugins
    'nacro90/numb.nvim',

}

local opts = {}

require("lazy").setup(plugins, opts)
