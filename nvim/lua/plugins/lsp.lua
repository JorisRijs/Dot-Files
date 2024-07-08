return {
   {
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v3.x',
    config = function() 
        local lsp = require('lsp-zero')
        lsp.extend_lspconfig()
        lsp.preset("recommended")
        lsp.on_attach(function(client, bufnr)
            -- see :help lsp-zero-keybindings
            -- to learn the available actions
            local opts = {buffer = bufnr, remap = false}

            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set("n", "<leader>vws", function() vim.lsp.workspace.symbol() end, opts)
            vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
            vim.keymap.set("n", "[d", function() vim.dagnostic.goto_next() end, opts)
            vim.keymap.set("n", "]d", function() vim.dagnostic.goto_prev() end, opts)
            vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
            vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
            vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
            vim.keymap.set("i", "C-h", function() vim.lsp.buf.signature_help() end, opts)
        end)
        lsp.setup()
    end
   },
    {
        "williamboman/mason.nvim",
        config = function() 
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function() 
            require("mason-lspconfig").setup({
                ensure_installed = {
                    'pyright',
                    'lua_ls',
                    'pylsp',
                    'terraformls',
                    'bashls',
                    'dotls',
                    'jsonls',
                    'ltex',
                    'yamlls',
                    'jsonls',
                    'rust_analyzer',
                    'marksman'
                }
            })
        end
    }, 
    {
        "neovim/nvim-lspconfig",
        config = function() 
            local lspconfig = require('lspconfig')

            -- lspconfig.pylsp.setup({})
            lspconfig.pylsp.setup({
              settings = {
                pylsp = {
                  configurationSources = {"pydocstyle", "pycodestyle"},
                  plugins = {
                    pycodestyle = {
                      ignore = {'W391'},
                      maxLineLength = 100
                    },
                    black = {
                      enabled = true,
                      line_length = 88,
                    },
                    ruff = {
                      enabled = true,
                      extendedSelect = {"I"},
                    },
                    mypy = {
                      live_mode = true,
                    }
                  },
                }
              }
            })

            lspconfig.pyright.setup({
              -- on_attach = lsp.on_attach,
              -- capabilities = lsp.capabilities,
              filetypes = {"python"},
            })

            lspconfig.terraformls.setup({})
            vim.api.nvim_create_autocmd({"BufWritePre"}, {
              pattern = {"*.tf", "*.tfvars"},
              callback = function()
                vim.lsp.buf.format()
              end,
            })
            lspconfig.lua_ls.setup({})
            lspconfig.bashls.setup({})
            lspconfig.dotls.setup({})
            lspconfig.ltex.setup({})
            lspconfig.yamlls.setup({})
            lspconfig.jsonls.setup({})
            lspconfig.rust_analyzer.setup({})
            lspconfig.marksman.setup({})
        --
        end,
    },

    {
        'hrsh7th/nvim-cmp',
        dependencies = {
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
        config = function() 
            local cmp = require('cmp')
            local luasnip = require('luasnip')
            require('luasnip.loaders.from_vscode')
            luasnip.config.setup{}

        cmp.setup{
          sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'luasnip' }, -- For luasnip users.
          }, {
            { name = 'buffer' },
          }),
          snippet = {
            expand = function(args)
              luasnip.lsp_expand(args.body)
            end,
          },
          completion = {
            completeopt = 'menu,menuone,noinsert'
          },
          mapping = cmp.mapping.preset.insert{
            ['<C-n>'] = cmp.mapping.select_next_item(),
            ['<C-p>'] = cmp.mapping.select_prev_item(),
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete {},
            ['<CR>'] = cmp.mapping.confirm {
              behavior = cmp.ConfirmBehavior.Replace,
              select = true,
            },
            ['<Tab>'] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
              else
                fallback()
              end
            end, { 'i', 's' }),
            ['<S-Tab>'] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
            end, { 'i', 's' }),
          },
        }
        -- `:` cmdline setup.
        cmp.setup.cmdline(':', {
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources({
            { name = 'path' }
          }, {
            {
              name = 'cmdline',
              option = {
                ignore_cmds = { 'Man', '!' }
              }
            }
          })
        })
        end
   },
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
  -- { "folke/neodev.nvim", enabled = false }, -- make sure to uninstall or disable neodev.nvim
}
