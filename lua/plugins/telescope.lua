-- https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file
return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
	config = function()
		local map = vim.keymap.set
		local builtin = require("telescope.builtin")

		map("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
		map("n", "<leader>Fg", builtin.git_files, { desc = "Telescope find git tracked files" })
		map("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
		map("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
		map("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
	end,
}
