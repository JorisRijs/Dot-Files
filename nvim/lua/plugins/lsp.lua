return {
    {
        "williamboman/mason.nvim",
        config = function() 
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function() 
            local lsp = require('lsp-zero')
            lsp.extend_lspconfig()
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
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v3.x',
    config = function() 
        vim.g.lsp_zero_extend_lspconfig = 0
        local lsp = require('lsp-zero')
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

            lspconfig.terraformls.setup({
                init_options = {
                  terraform = {
                    path = "/opt/homebrew/bin/terraform"
                  }
                }
            })
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
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for Neovim
      { 'williamboman/mason.nvim', config = true }, -- NOTE: Must be loaded before dependants
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP.
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {} },

      -- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
      -- used for completion, annotations and signatures of Neovim apis
      { 'folke/neodev.nvim', opts = {} },
    },
    config = function ()
        
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
            callback = function (event)
                local map = function(keys, func, desc)
                    vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
                end
                map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

              -- Find references for the word under your cursor.
              map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

              -- Jump to the implementation of the word under your cursor.
              --  Useful when your language has ways of declaring types without an actual implementation.
              map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

              -- Jump to the type of the word under your cursor.
              --  Useful when you're not sure what type a variable is and you want to see
              --  the definition of its *type*, not where it was *defined*.
              map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

              -- Fuzzy find all the symbols in your current document.
              --  Symbols are things like variables, functions, types, etc.
              map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

              -- Fuzzy find all the symbols in your current workspace.
              --  Similar to document symbols, except searches over your entire project.
              map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

              -- Rename the variable under your cursor.
              --  Most Language Servers support renaming across files, etc.
              map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

              -- Execute a code action, usually your cursor needs to be on top of an error
              -- or a suggestion from your LSP for this to activate.
              map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

              -- Opens a popup that displays documentation about the word under your cursor
              --  See `:help K` for why this keymap.
              map('K', vim.lsp.buf.hover, 'Hover Documentation')

              -- WARN: This is not Goto Definition, this is Goto Declaration.
              --  For example, in C this would take you to the header.
              map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

              local client = vim.lsp.get_client_by_id(event.data.client_id)
              if client and client.server_capabilities.documentHighlightProvider then
                local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-hightlight', { clear = false })
                vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI'}, {
                    buffer = event.buf,
                    group = highlight_augroup,
                    callback = vim.lsp.buf.document_highlight,
                })

                vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                    buffer = event.buf,
                    group = highlight_augroup,
                    callback = vim.lsp.buf.clear_references,
                })

                vim.api.nvim_create_autocmd('LspDetach', {
                    group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = false }),
                    callback = function (event2)
                        vim.lsp.buf.clear_references()
                        vim.api.nvim_clear_autocmds {group = 'kickstart-lsp-hightlight', buffer = event2.buf}
                    end,
                })
              end

            end
        })

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

            local server = {
                terraformls = {
                    cmd = { 'terraform-ls', 'serve' },
                    filetypes = { 'terraform' },
                    root_dir = require('lspconfig.util').root_pattern('.terraform', '.git'),
                    settings = {
                        rootMarkers = { '.terraform', '.git' },
                    },
                    capabilities = capabilities,
                },
            }

    end
  },
  -- { "folke/neodev.nvim", enabled = false }, -- make sure to uninstall or disable neodev.nvim
}
