local lsp = require('lsp-zero')

lsp.preset("recommended")


-- Configure the behavior and keybindings for cmp, which is directly linked to lsp, thus in this file
local cmp = require('cmp')
local luasnip = require('luasnip')
require('luasnip.loaders.from_vscode')
luasnip.config.setup{}

cmp.setup{
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

require'lspconfig'.pylsp.setup{
  settings = {
    pylsp = {
      configurationSources = {"pydocstyle", "pycodestyle"},
      plugins = {
        pycodestyle = {
          ignore = {'W391'},
          maxLineLength = 100
        },
        ruff = {
          enabled = true,
          extendedSelect = {"I"},
        },
      },
    }
  }
}

require'lspconfig'.pyright.setup({
  on_attach = lsp.on_attach,
  capabilities = lsp.capabilities,
  filetypes = {"python"},
})

require'lspconfig'.terraformls.setup{}
vim.api.nvim_create_autocmd({"BufWritePre"}, {
  pattern = {"*.tf", "*.tfvars"},
  callback = function()
    vim.lsp.buf.format()
  end,
})

lsp.setup()

-- see :help lsp-zero-guide:integrate-with-mason-nvim
-- to learn how to use mason.nvim with lsp-zero
require('mason').setup({})
require('mason-lspconfig').setup({

    ensure_installed = {
        'pyright',
        'lua_ls',
        'pylsp',
        'terraformls'
    },
    handlers = {
        lsp.default_setup,
    }
})

