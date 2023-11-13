local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '≤', '<Cmd>BufferPrevious<CR>', opts)
map('n', '≥', '<Cmd>BufferNext<CR>', opts)
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)

-- close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
