require('nvim_comment').setup({create_mappings = false})

vim.api.nvim_set_keymap("n", "<C-c>", ":CommentToggle<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("v", "<C-c>", ":CommentToggle<CR>", {noremap = true, silent = true})

