require'nvim-treesitter.configs'.setup {
	ensure_installed = { "ruby", "javascript", "lua", "rust", "python", "elixir" },

	sync_install = false,

	auto_install = true,

	highlight = {
		enable = true,
	},
}
