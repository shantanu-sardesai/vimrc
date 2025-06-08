return {
	{ -- Matches brackets.
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{ -- Colorizes the REPL buffer.
    -- not configured to work with Conjure properly, configuration docs:
    --   https://github.com/m00qek/baleia.nvim?tab=readme-ov-file#with-conjure
		"m00qek/baleia.nvim",
		version = "*",
		config = function()
			vim.g.baleia = require("baleia").setup({})

			-- Command to colorize the current buffer
			vim.api.nvim_create_user_command("BaleiaColorize", function()
				vim.g.baleia.once(vim.api.nvim_get_current_buf())
			end, { bang = true })

			-- Command to show logs
			vim.api.nvim_create_user_command("BaleiaLogs", vim.g.baleia.logger.show, { bang = true })
		end,
	},
	{ "Olical/conjure" }, -- Primary Clojure plugin.
	{ -- Plugin for enabling structural editing.
		"julienvincent/nvim-paredit",
		lazy = false,
		config = function()
			require("nvim-paredit").setup()
		end,
	},
}
