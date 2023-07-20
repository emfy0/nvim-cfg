zenmode = require("zen-mode")

function roggleZenMode()
  zenmode.toggle({
    window = {
      width = .65 -- width will be 85% of the editor width
    },
    plugins = {
      -- disable some global vim options (vim.o...)
      -- comment the lines to not apply the options
      options = {
        ruler = true, -- disables the ruler text in the cmd line area
      },
    }
  })
end

vim.keymap.set("n", "<C-z>", roggleZenMode)

