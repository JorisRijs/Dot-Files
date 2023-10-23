require("jolly.remap")


-- Show matching brackets
vim.o.showmatch = true

-- Case insensitive matching
vim.o.ignorecase = true

-- Middle-click paste with mouse
vim.o.mouse = "v"

-- Highlight search results
vim.o.hlsearch = true

-- Indent a new line the same amount as the line just typed
vim.o.autoindent = true

-- Add line numbers
vim.o.number = true

-- Number of columns occupied by a tab character
vim.o.tabstop = 4

-- Convert tabs to white space
vim.o.expandtab = true

-- Width for autoindents
vim.o.shiftwidth = 4

-- See multiple spaces as tabstops so <BS> does the right thing
vim.o.softtabstop = 4

vim.wo.relativenumber=true 
