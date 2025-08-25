-- explore themes at:
--  https://vimcolorschemes.com/i/trending
--  https://dotfyle.com/neovim/colorscheme/trending
--  https://nvchad.com/themes/

local set_theme = vim.cmd.colorscheme

local gruvbox = {
	"ellisonleao/gruvbox.nvim",
	config = function()
		vim.opt.scrolloff = 0
		set_theme("gruvbox")
	end,
}
local github = {
	"projekt0n/github-nvim-theme",
	name = "github-theme",
	config = function()
		-- TODO: Improve theme line highlight. When the vim line highlight option is on the theme uses a terible background
		--       and foreground colors. Same for `darcula`.
		require("github-theme").setup()

		-- set_theme("github_dark_dimmed")
		set_theme("github_light")
	end,
} -- https://github.com/projekt0n/github-nvim-theme
local okai = { "okaihe/okai" } -- https://github.com/okaihe/okai
local vesper = { "datsfilipe/vesper.nvim" } -- https://github.com/datsfilipe/vesper.nvim
local min = { "datsfilipe/min-theme.nvim" } -- https://github.com/datsfilipe/min-theme.nvim
local tokyo_dark = { "tiagovla/tokyodark.nvim" } -- https://github.com/tiagovla/tokyodark.nvim
local catppuccin = { "catppuccin/nvim" } -- https://github.com/catppuccin/nvim
local kanagawa = { "rebelot/kanagawa.nvim" } -- https://github.com/rebelot/kanagawa.nvim
local ayu = {
	"ayu-theme/ayu-vim",
	config = function()
		set_theme("ayu")
	end,
} -- https://github.com/ayu-theme/ayu-vim
local darcula_dark = {
	"xiantang/darcula-dark.nvim",
	config = function()
		require("darcula").setup({
			opt = {
				integrations = {
					telescope = false,
				},
			},
		})

		set_theme("darcula-dark")
	end,
} -- https://github.com/xiantang/darcula-dark.nvim?tab=readme-ov-file
local darcula = {
	"doums/darcula",
	config = function()
		set_theme("darcula")
	end,
} -- https://github.com/doums/darcula
local bamboo = { "ribru17/bamboo.nvim" } -- https://github.com/ribru17/bamboo.nvim
local nordic = { "AlexvZyl/nordic.nvim" } -- https://github.com/AlexvZyl/nordic.nvim
local habamax = {
	"ntk148v/habamax.nvim",
	dependencies = { "rktjmp/lush.nvim" },
	config = function()
		set_theme("habamax.nvim")
	end,
} -- https://github.com/ntk148v/habamax.nvim
local oxocarbon = { "nyoom-engineering/oxocarbon.nvim" } -- https://github.com/nyoom-engineering/oxocarbon.nvim

return gruvbox
