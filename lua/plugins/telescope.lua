return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- optional but recommended
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope list buffers" })
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set(
			"n",
			"<leader>fd",
			"<cmd>vsplit | lua vim.lsp.buf.definition()<CR>",
			{ desc = "Jump to definition in vsplit" }
		)
		vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Telescope grep word under cursor" })
		vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "Telescope resume last action" })
	end,
}
