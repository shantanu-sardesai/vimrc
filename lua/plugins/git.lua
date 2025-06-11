return {
	"tpope/vim-fugitive",
	config = function()
		local map = vim.keymap.set

		map("n", "<leader>gs", vim.cmd.Git)
		map("n", "<leader>gb", function()
			vim.cmd.Git("blame")
		end)
		map("n", "gu", "<cmd>diffget //2<CR>")
		map("n", "gh", "<cmd>diffget //3<CR>")

		local sardesai_dev_group = vim.api.nvim_create_augroup("sardesai_dev_group", {})
		local autocmd = vim.api.nvim_create_autocmd

		autocmd("BufWinEnter", {
			group = sardesai_dev_group,
			pattern = "*",
			callback = function()
				if vim.bo.ft ~= "fugitive" then
					return
				end

				local bufnr = vim.api.nvim_get_current_buf()
				local opts = { buffer = bufnr, remap = false }

				map("n", "<leader>p", function()
					vim.cmd.Git("push")
				end, opts)
				map("n", "<leader>P", function()
					vim.cmd.Git({ "pull", "--rebase" })
				end, opts)
				map("n", "<leader>t", ":Git push -u origin ", opts)
			end,
		})
	end,
}
