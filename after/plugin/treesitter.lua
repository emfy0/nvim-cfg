require'nvim-treesitter.configs'.setup {
	ensure_installed = { "ruby", "javascript", "lua", "rust" },

	sync_install = false,

	auto_install = true,

	highlight = {
		disable = { "lua" },
		enable = true,
	},
}
