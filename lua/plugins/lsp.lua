return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "folke/neoconf.nvim", cmd = "Neoconf", config = true },
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
		opts = {
			diagnositics = {
				underline = true,
				update_in_insert = false,
				virtual_text = { spacing = 2, prefix = "●" },
				severity_sort = true,
			},
			-- Automatically format on save
			autoformat = true,
			-- options for vim.lsp.buf.format
			-- `bufnr` and `filter` is handled by the LazyVim formatter,
			-- but can be also overridden when specified
			format = {
				formatting_options = nil,
				timeout_ms = nil,
			},
			servers = {
				lua_ls = {
					mason = false,
				},
				clangd = {
					mason = false,
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
	},
	{
		"saghen/blink.compat",
		-- use v2.* for blink.cmp v1.*
		version = "2.*",
		-- lazy.nvim will automatically load the plugin when it's required by blink.cmp
		lazy = false,
		-- make sure to set opts so that lazy.nvim calls blink.compat's setup
		opts = {},
	},
	{
		"saghen/blink.cmp",
		version = "1.*",
		dependencies = {
			-- add source
			{ "dmitmel/cmp-digraphs" },
		},
		sources = {
			-- remember to enable your providers here
			default = { "lsp", "path", "snippets", "buffer", "digraphs" },
			providers = {
				-- create provider
				digraphs = {
					-- IMPORTANT: use the same name as you would for nvim-cmp
					name = "digraphs",
					module = "blink.compat.source",

					-- all blink.cmp source config options work as normal:
					score_offset = -3,

					-- this table is passed directly to the proxied completion source
					-- as the `option` field in nvim-cmp's source config
					--
					-- this is NOT the same as the opts in a plugin's lazy.nvim spec
					opts = {
						-- this is an option from cmp-digraphs
						cache_digraphs_on_start = true,

						-- If you'd like to use a `name` that does not exactly match nvim-cmp,
						-- set `cmp_name` to the name you would use for nvim-cmp, for instance:
						-- cmp_name = "digraphs"
						-- then, you can set the source's `name` to whatever you like.
					},
				},
			},
		},
	},
	{
		"wellle/context.vim",
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
	},
}
