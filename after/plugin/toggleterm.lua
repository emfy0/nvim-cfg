local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
    cmd = "lazygit", 
    hidden = true, 
    dir = "git_dir",
    direction = "float",
    float_opts = {
        border = "double",
        width = 1000,
        height = 1000,
    },
    -- function to run on opening the terminal
    on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
    end,
    -- function to run on closing the terminal
    on_close = function(term)
        vim.cmd("startinsert!")
    end,
})

function _spawn_terminal(command)
  local terminal = Terminal:new({
    cmd = command,
    hidden = true, 
    dir = "git_dir",
    direction = "float",
    float_opts = {
        border = "double",
    },
    -- function to run on opening the terminal
    on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
    end,
    -- function to run on closing the terminal
    on_close = function(term)
        vim.cmd("startinsert!")
    end,
    persist_mode = false,
    close_on_exit = false
  })

  terminal:toggle()
end

function _lazygit_toggle()
  lazygit:toggle()
end

function _rspec_toggle()
  _spawn_terminal("dip rspec")
end

function _rspec_current_line_toggle()
  local path = vim.fn.expand("%:~:.")
  local lineNum = vim.fn.line(".")

  _spawn_terminal("dip rspec " .. path .. ":" .. lineNum)
end

function _rspec_current_file_toggle()
  local path = vim.fn.expand("%:~:.")

  _spawn_terminal("dip rspec " .. path)
end

function _rswag_toggle()
  _spawn_terminal("dip rswag ")
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})

vim.api.nvim_set_keymap("n", "<leader>tf", "<cmd>lua _rspec_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>tf", "<cmd>lua _rspec_current_file_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>tc", "<cmd>lua _rspec_current_line_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>ts", "<cmd>lua _rswag_toggle()<CR>", {noremap = true, silent = true})
