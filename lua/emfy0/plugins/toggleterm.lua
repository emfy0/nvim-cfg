local Terminal  = require('toggleterm.terminal').Terminal

-- local lazygit = Terminal:new({
--     cmd = [=[
--       export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir
--
--       lazygit
--
--       if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
--               cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
--               rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
--       fi
--     ]=],
--     autochdir = false,
--     hidden = true, 
--     -- dir = "git_dir",
--     direction = "float",
--     float_opts = {
--         border = "double",
--         width = 1000,
--         height = 1000,
--     },
--     -- function to run on opening the terminal
--     on_open = function(term)
--         vim.cmd("startinsert!")
--         vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
--     end,
--     -- function to run on closing the terminal
--     on_close = function(term)
--         vim.cmd("startinsert!")
--     end,
-- })

function _lazygit_toggle()
  Terminal:new({
      cmd = [=[
        lazygit
      ]=],
      autochdir = false,
      hidden = true, 
      -- dir = "git_dir",
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
  }):toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
