return {
	{
		-- FIXME: Auto-fix ESLint errors on save
		"neovim/nvim-lspconfig",
		config = function()
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.mjs", "*.cjs" },
				callback = function()
					local clients = vim.lsp.get_clients({ bufnr = 0, name = "eslint" })
					if #clients > 0 then
						vim.cmd("LspEslintFixAll")
					end
				end,
			})
		end,
	},
}
