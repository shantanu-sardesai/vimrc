return {
	"neovim/nvim-lspconfig",
	dependencies = {
    {
      "folke/lazydev.nvim", -- let's the lua LSP see the vim related bindings.
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
	},
	config = function()
		local lspconf = require("lspconfig")
    
    lspconf.lua_ls.setup({})
    lspconf.clojure_lsp.setup({})
    lspconf.clangd.setup({})
    -- lspconf.ts_ls.setup({}) -- typescript language server.
	end,
}
