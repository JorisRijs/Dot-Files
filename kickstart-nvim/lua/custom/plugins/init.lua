-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
  },
  {
    'akinsho/toggleterm.nvim',
    version = '*', -- Use the latest version
    config = function()
      require('toggleterm').setup {
        -- Size can be a number or function which is passed the current terminal
        size = 20,
        -- Key mapping to toggle terminal
        open_mapping = [[<C-\>]],
        -- Hide the number column in terminal buffers
        hide_numbers = true,
        -- Shade terminal background
        shade_terminals = true,
        -- Degree by which to darken to terminal colour
        shading_factor = 2,
        -- Start terminal in insert mode
        start_in_insert = true,
        -- Open mappings apply in insert mode
        insert_mappings = true,
        -- Open mappings apply in the terminal
        terminal_mappings = true,
        -- Persist terminal size across sessions
        persist_size = true,
        -- Terminal direction ('vertical' | 'horizontal' | 'tab' | 'float')
        direction = 'float',
        -- Close terminal when process exits
        close_on_exit = true,
        -- Change the default shell
        shell = vim.o.shell,
        -- Options specific to floating terminal
        float_opts = {
          -- Border style ('single' | 'double' | 'shadow' | 'curved' | ... )
          border = 'curved',
          -- Transparency of the floating window
          winblend = 0,
          -- Highlight groups for the terminal
          highlights = {
            border = 'Normal',
            background = 'Normal',
          },
        },
      }

      -- Optional: Keybindings for different terminal directions
      function _G.set_terminal_keymaps()
        local opts = { buffer = 0 }
        vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
        vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
        vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
      end

      -- Apply the keymaps when terminal is opened
      vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'
    end,
  },
  {
    'epwalsh/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = 'markdown',
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    dependencies = {
      -- Required.
      'nvim-lua/plenary.nvim',

      -- see below for full list of optional dependencies 👇
    },
    opts = {
      workspaces = {
        {
          name = 'personal',
          path = '~/vaults/personal',
        },
        {
          name = 'work',
          path = '~/vaults/work',
        },
      },

      -- see below for full list of options 👇
    },
  },
}
