return {
	"junegunn/seoul256.vim",
	priority = 1000, -- make sure to load this before all the other plugins
	init = function()
		vim.cmd.colorscheme("seoul256")
		vim.cmd.hi("Comment gui=none")
	end,
}
