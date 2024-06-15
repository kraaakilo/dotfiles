require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("i", "jk", "<ESC>")

-- Map Ctrl + Arrows to move around splits.
map('n', '<C-Left>', '<C-w>h', { noremap = true, silent = true })
map('n', '<C-Down>', '<C-w>j', { noremap = true, silent = true })
map('n', '<C-Up>', '<C-w>k', { noremap = true, silent = true })
map('n', '<C-Right>', '<C-w>l', { noremap = true, silent = true })

-- Map Ctrl + q to close the current split
map('n', '<C-q>', ':q<CR>', { noremap = true, silent = true })

