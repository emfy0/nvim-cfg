vim.g.mapleader = " "

vim.keymap.set("n", "gn", ":bnext<CR>")
vim.keymap.set("n", "gp", ":bprev<CR>")
vim.keymap.set("n", "<leader>q", ":BD<CR>")

vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")

vim.keymap.set("v", "H", "^")
vim.keymap.set("v", "L", "$")

vim.keymap.set("n", "<leader>w", ":w<CR>")

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>y", "\"+y")

vim.keymap.set("v", "<leader>p", "\"+p")
vim.keymap.set("v", "<leader>P", "\"+P")

vim.keymap.set("n", "<leader>p", "\"+p")
vim.keymap.set("n", "<leader>P", "\"+P")

vim.keymap.set("n", "'", "\"_")
vim.keymap.set("v", "'", "\"_")

vim.keymap.set("n", "U", ":redo<CR>")

vim.keymap.set("i", "<A-BACKSPACE>", "<C-w>")

vim.keymap.set("n", "p", "pgvy")
vim.keymap.set("v", "p", "pgvy")

vim.keymap.set("n", "<leader>n", ":let @+ = expand(\"%\")<CR>")

vim.keymap.set("n", "<leader>o", ":%bd|e#|bnext|BD<CR>")

vim.keymap.set("n", "Q", "@q")

