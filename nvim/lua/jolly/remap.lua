local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap
local builtin = require 'telescope.builtin'

vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>-', vim.cmd.split)
vim.keymap.set('n', '<leader>\\', vim.cmd.vsplit)

-- Copy to clipboard
vim.keymap.set('v', '<leader>y', '"+y', { noremap = true })
vim.keymap.set('n', '<leader>Y', '"+yg_', { noremap = true })
vim.keymap.set('n', '<leader>y', '"+y', { noremap = true })
vim.keymap.set('n', '<leader>yy', '"+yy', { noremap = true })

-- Paste from clipboard
vim.keymap.set('n', '<leader>p', '"+p', { noremap = true })
vim.keymap.set('n', '<leader>P', '"+P', { noremap = true })
vim.keymap.set('v', '<leader>p', '"+p', { noremap = true })
vim.keymap.set('v', '<leader>P', '"+P', { noremap = true })

vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>td', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>tt', '<cmd>TodoTelescope<cr>', {})
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string { search = vim.fn.input 'Grep > ' }
end)

-- Move to previous/next (barbar)
vim.keymap.set('n', '≤', '<Cmd>BufferPrevious<CR>', opts)
vim.keymap.set('n', '≥', '<Cmd>BufferNext<CR>', opts)
vim.keymap.set('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
vim.keymap.set('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)

-- close buffer (barbar)
vim.keymap.set('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
vim.keymap.set('n', 'ç', '<Cmd>BufferClose<CR>', opts)

vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
