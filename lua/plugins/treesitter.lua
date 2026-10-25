return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").install({ "lua", "rust" })

		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "lua", "rust" },
			callback = function()
				vim.treesitter.start()
			end,
		})
	end,
}
