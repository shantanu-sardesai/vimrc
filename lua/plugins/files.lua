return {
	{ -- https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			local map = vim.keymap.set
			local builtin = require("telescope.builtin")
			local actions = require("telescope.actions")

			-- builtin config option documentation:
			--  https://github.com/nvim-telescope/telescope.nvim/blob/master/doc/telescope.txt
			map("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
			map("n", "<leader>Fg", builtin.git_files, { desc = "Telescope find git tracked files" })
			map("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
			map("n", "<leader>fb", function()
				builtin.buffers({
					sort_mru = true,
					ignore_current_buffer = true,
					only_cwd = true,
				})
			end, { desc = "Telescope buffers" })
			map("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
			map("n", "<leader>fo", function()
				builtin.oldfiles({
					only_cwd = true,
				})
			end, { desc = "Telescope old files" })
			map("n", "<leader>fs", function()
				builtin.lsp_document_symbols({
					desc = "Telescope list all symbols in the current document",
				})
			end)
			map("n", "<leader>gd", function()
				builtin.diagnostics({})
			end)
			map("n", "<leader>gr", function()
				builtin.lsp_references({})
			end)
		end,
	},
	{ -- plugin for file explorer.
		"folke/snacks.nvim",
		---@type snacks.Config
		opts = {
			explorer = {
				-- your explorer configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			},
			picker = {
				sources = {
					explorer = {
						-- your explorer picker configuration comes here
						-- or leave it empty to use the default settings
					},
				},
			},
		},
		keys = {
			{
				"<leader>e",
				function()
					Snacks.explorer()
				end,
				desc = "File Explorer",
			},
		},
	},
}
