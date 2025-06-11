return {
	"nvim-treesitter/nvim-treesitter",
	version = false, -- last release is way too old and doesn't work on Windows
	build = ":TSUpdate",
	lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
	opts = {
		highlight = { enable = true },
		indent = { enable = true },
		ensure_installed = {
			-- compulsory ones.
			"c",
			"lua",
			"vim",
			"vimdoc",
			"query",
			"markdown",
			"markdown_inline",
			-- custom.
			"clojure",
			"java",
		},
		sync_install = false,
		auto_install = false,
	},
}
