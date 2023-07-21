local builtin = require('telescope.builtin')

local telescope = require('telescope')

telescope.setup {
  pickers = {
    find_files = {
      hidden = true
    }
  }
}

vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>?', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})

vim.keymap.set('n', '<leader>/', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

local telescope_last = 0

function telescope_resume()
  if telescope_last == 0 then
    telescope_last = 1
    builtin.find_files()
  else
    builtin.resume()
  end
end

vim.keymap.set("n", "<leader>\\", telescope_resume)

