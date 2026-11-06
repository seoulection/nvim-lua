return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
    local pattern = {
      "go",
      "javascript",
      "lua",
      "rust",
      "tsx",
      "typescript"
    }

		require("nvim-treesitter").install(pattern)

		vim.api.nvim_create_autocmd("FileType", {
			pattern = pattern,
			callback = function()
				vim.treesitter.start()
			end,
		})
	end,
}
