return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = false, -- last release is way too old and doesn't work on Windows
		build = ":TSUpdate",
		lazy = false, -- load treesitter early when opening a file from the cmdline
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
				"bash",
				"cmake",
				"cpp",
				"clojure",
				"java",
				-- web.
				"html",
				"javascript",
				"css",
				"tsx",
				"typescript",
				-- file formats.
				"json",
				"yaml",
			},
			sync_install = true,
			auto_install = true,
		},
	},
}
