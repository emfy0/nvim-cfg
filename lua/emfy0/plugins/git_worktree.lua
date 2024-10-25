require("telescope").load_extension("git_worktree")
local git_worktree = require('telescope').extensions.git_worktree

vim.keymap.set('n', '<leader>gw', function()  git_worktree.git_worktree() end, {})
vim.keymap.set('n', '<leader>gW', function() git_worktree.create_worktree() end, {})

local Hooks = require("git-worktree.hooks")
local Job = require("plenary.job")

Hooks.register(Hooks.type.SWITCH, Hooks.builtins.update_current_buffer_on_switch)
-- Hooks.register(Hooks.type.SWITCH, function(_, _)
--     Job:new({
--       'git', 'submodule', 'update', '--init', '--recursive'
--     }):start()
-- end)
