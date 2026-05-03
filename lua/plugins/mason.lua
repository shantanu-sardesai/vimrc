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
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "mason-org/mason.nvim" },
		opts = {
			-- Installation instructions for roslyn via Mason:
			-- https://github.com/seblyng/roslyn.nvim?tab=readme-ov-file#-installation
			ensure_installed = { "roslyn" },
		},
	},
}
