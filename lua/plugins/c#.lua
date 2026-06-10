return {
	"seblyng/roslyn.nvim",
	---@module 'roslyn.config'
	---@type RoslynNvimConfig
	opts = {
		-- your configuration comes here; leave empty for default settings
	},
	init = function()
		vim.api.nvim_create_autocmd("VimLeavePre", {
			callback = function()
				for _, client in ipairs(vim.lsp.get_clients({ name = "roslyn" })) do
					client.stop(true)
				end
			end,
		})
	end,
}
