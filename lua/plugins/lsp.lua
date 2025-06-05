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
    local nvim_map = vim.api.nvim_set_keymap
    local nvim_buf_map = vim.api.nvim_buf_set_keymap
    local opts = { noremap=true, silent=true }

    nvim_map('n', '<leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    nvim_map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    nvim_map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

    local on_attach = function(_client, bufnr)
      nvim_buf_map(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
      nvim_buf_map(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
      nvim_buf_map(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
      nvim_buf_map(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
      nvim_buf_map(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
      nvim_buf_map(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
      nvim_buf_map(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    end
		local lspconf = require("lspconfig")

    lspconf.lua_ls.setup({})
    lspconf.clojure_lsp.setup({})
    lspconf.clangd.setup({
      on_attach = on_attach,
      init_options = {
        compilationDatabaseDirectory = "build";
        index = {
          threads = 0;
        };
        clang = {
          excludeArgs = {};
        };
      }
    })
    lspconf.ts_ls.setup({}) -- typescript language server.
	end,
}
