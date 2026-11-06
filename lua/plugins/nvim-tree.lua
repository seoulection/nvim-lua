return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("nvim-tree").setup({
			filters = { dotfiles = true },
			view = {
        number = true,
        width = {
          min = 30,
          max = -1,
          padding = 1,
        },
      },
		})
		vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFindFileToggle<cr>", { desc = "Toggle file tree" })
	end,
}
