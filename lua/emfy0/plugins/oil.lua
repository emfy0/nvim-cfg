CustomOilBar = function()
  local path = vim.fn.expand "%"
  path = path:gsub("oil://", "")

  return "  " .. vim.fn.fnamemodify(path, ":.")
end

require("oil").setup {
  skip_confirm_for_simple_edits = true,
  watch_for_changes = true,
  columns = { "icon" },
  keymaps = {
    -- ["<C-s>"] = false,
    -- ["<C-v>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
    ["<C-c>"] = false,
    ["q"] = "actions.close",
    ["<C-h>"] = false,
    ["<C-j>"] = false,
    ["<C-k>"] = false,
    ["<C-l>"] = false,
  },
  win_options = {
    winbar = "%{v:lua.CustomOilBar()}",
  },
  view_options = {
    show_hidden = true,
  },
}

-- Open parent directory in current window
-- vim.keymap.set("n", "-", require("oil").toggle_float, { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>e", "<cmd>Telescope oil<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
-- Open parent directory in floating window
-- vim.keymap.set("n", "-", require("oil").toggle_float)
