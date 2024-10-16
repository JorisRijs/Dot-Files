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
        open_mapping = [[<c-\>]],
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
}
