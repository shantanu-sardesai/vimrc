return {
	"julienvincent/nvim-paredit",
	config = function()
		local paredit = require("nvim-paredit")

		paredit.setup({
			indent = {
				enabled = true,
			},
		})
	end,
}
