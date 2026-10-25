return {
	"neovim/nvim-lspconfig",
	opts = {},
	dependencies = {
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
		"saghen/blink.cmp",
	},
	config = function()
		local lsps = {
			"lua_ls",
			"rust_analyzer",
		}

		-- initial setup
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = lsps,
		})

		vim.lsp.enable(lsps)
	end,
}
