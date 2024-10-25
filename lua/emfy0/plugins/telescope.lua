-- require("telescope.health").check()

local builtin = require('telescope.builtin')

local telescope = require('telescope')

local previewers = require("telescope.previewers")
local Job = require("plenary.job")

local new_maker = function(filepath, bufnr, opts)
  filepath = vim.fn.expand(filepath)
  Job:new({
    command = "file",
    args = { "--mime-type", "-b", filepath },
    on_exit = function(j)
      local mime_type = vim.split(j:result()[1], "/")[1]
      if mime_type == "text" then
        previewers.buffer_previewer_maker(filepath, bufnr, opts)
      else
        -- maybe we want to write something to the buffer here
        vim.schedule(function()
          vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
        end)
      end
    end
  }):sync()
end

telescope.setup {
  pickers = {
    find_files = {
      hidden = true
    }
  },
  defaults = {
    buffer_previewer_maker = new_maker,
    vimgrep_arguments = {
      "rg",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden"
    }
  }
}

vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>/', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})

-- vim.keymap.set('n', '<leader>/', function()
-- 	builtin.grep_string({ search = vim.fn.input("Grep > ") })
-- end)

vim.keymap.set("n", "<leader>F", builtin.resume, {})
