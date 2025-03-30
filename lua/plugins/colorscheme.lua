return {
	{
		"savq/melange-nvim",
		name = "melange",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			--require("melange").setup({
			--	-- ...
			--})

			vim.opt.termguicolors = true
			vim.cmd.colorscheme("melange")
		end,
	},
}
