-- TODO: Remove the Crashdummyy/mason-registry once the roslyn LSP is available
-- in the upstream mason registry. Track: https://github.com/mason-org/mason-registry/pull/6330
return {
	{
		"mason-org/mason.nvim",
		opts = {
			registries = {
				-- Extra registry needed to install the roslyn language server,
				-- which is not yet available in the upstream mason registry.
				"github:Crashdummyy/mason-registry",
				"github:mason-org/mason-registry",
			},
			-- roslyn is managed by seblyng/roslyn.nvim, not lspconfig, so install it here directly
			ensure_installed = { "roslyn" },
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "mason-org/mason.nvim" },
	},
}
