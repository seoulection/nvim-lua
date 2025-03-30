return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"bash",
			"c",
			"eex",
			"elixir",
			"erlang",
			"heex",
			"html",
			"lua",
			"luadoc",
			"markdown",
			"surface",
			"vim",
			"vimdoc",
		},
		-- autoinstall languages that are not installed
		auto_install = true,
		highlight = { enable = true },
		indent = { enable = true },
	},
	config = function(_, opts)
		-- see `:help nvim-treesitter`

		---@diagnostic disable-next-line: missing-fields
		require("nvim-treesitter.configs").setup(opts)
	end,
}
