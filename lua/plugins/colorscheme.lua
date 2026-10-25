return {
	"morhetz/gruvbox",
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("gruvbox")
	end,
}
-- return {
-- 	"catppuccin/nvim",
-- 	name = "catppuccin",
-- 	priority = 1000,
-- 	config = function()
-- 		require("catppuccin").setup({
-- 			flavour = "mocha",
-- 		})
--
-- 		vim.cmd.colorscheme("catppuccin-nvim")
-- 	end,
-- }
-- return {
-- 	"rebelot/kanagawa.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		require("kanagawa").setup({
-- 			background = { dark = "dragon", light = "lotus" },
-- 		})
--
-- 		vim.cmd.colorscheme("kanagawa")
-- 	end,
-- }
