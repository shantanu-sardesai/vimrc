return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup({
				lsp = {
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
					},
				},
				-- you can enable a preset for easier configuration
				presets = {
					bottom_search = true, -- use a classic bottom cmdline for search
					command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = false, -- add a border to hover docs and signature help
				},
			})
		end,
	},
	-- statusline
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
		config = function()
			-- Custom Lualine component to show attached language server
			local clients_lsp = function()
				local clients = vim.lsp.get_clients()
				if next(clients) == nil then
					return ""
				end

				local c = {}
				for _, client in pairs(clients) do
					table.insert(c, client.name)
				end
				return " " .. table.concat(c, "|")
			end

			require("lualine").setup({
				options = {
					theme = custom_catppuccin,
					component_separators = "",
					section_separators = { left = "", right = "" },
					disabled_filetypes = { "alpha", "Outline" },
				},
				sections = {
					lualine_a = {
						{ "mode", separator = { left = " ", right = "" }, icon = "" },
					},
					lualine_b = {
						{
							"filetype",
							icon_only = true,
							padding = { left = 1, right = 0 },
						},
						"filename",
					},
					lualine_c = {
						{
							"branch",
							icon = "",
						},
						{
							"diff",
							symbols = { added = " ", modified = " ", removed = " " },
							colored = false,
						},
					},
					lualine_x = {
						{
							"diagnostics",
							symbols = { error = " ", warn = " ", info = " ", hint = " " },
							update_in_insert = true,
						},
					},
					lualine_y = { clients_lsp },
					lualine_z = {
						{ "location", separator = { left = "", right = " " }, icon = "" },
					},
				},
				inactive_sections = {
					lualine_a = { "filename" },
					lualine_b = {},
					lualine_c = {},
					lualine_x = {},
					lualine_y = {},
					lualine_z = { "location" },
				},
				extensions = { "toggleterm", "trouble" },
			})
		end,
	},
}
