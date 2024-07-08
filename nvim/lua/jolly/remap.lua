local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap
local builtin = require 'telescope.builtin'

vim.g.mapleader = ' '

map('n', '<leader>-', vim.cmd.split)
map('n', '<leader>\\', vim.cmd.vsplit)

-- Copy to clipboard
map('v', '<leader>y', '"+y', { noremap = true })
map('n', '<leader>Y', '"+yg_', { noremap = true })
map('n', '<leader>y', '"+y', { noremap = true })
map('n', '<leader>yy', '"+yy', { noremap = true })

-- Paste from clipboard
map('n', '<leader>p', '"+p', { noremap = true })
map('n', '<leader>P', '"+P', { noremap = true })
map('v', '<leader>p', '"+p', { noremap = true })
map('v', '<leader>P', '"+P', { noremap = true })

map('n', 'ff', builtin.find_files, {})
map('n', '<C-p>', builtin.git_files, {})
map('n', '<leader>fg', builtin.live_grep, {})
map('n', '<leader>td', builtin.diagnostics, {})
map('n', '<leader>tt', '<cmd>TodoTelescope<cr>', {})
map('n', '<leader>ps', function()
  builtin.grep_string { search = vim.fn.input 'Grep > ' }
end)

-- Move to previous/next (barbar)
map('n', '≤', '<Cmd>BufferPrevious<CR>', opts)
map('n', '≥', '<Cmd>BufferNext<CR>', opts)
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)

-- close buffer (barbar)
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
map('n', 'ç', '<Cmd>BufferClose<CR>', opts)

map('n', '<leader>u', vim.cmd.UndotreeToggle)
