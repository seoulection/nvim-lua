return {
	"stevearc/conform.nvim",
	lazy = false,
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = false,
		format_on_save = function(bufnr)
			-- disabling filetypes
			local disable_filetypes = { c = true, cpp = true }
			return {
				timeout_ms = 500,
				lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
			}
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			-- run multiple formatters
			javascript = { "prettier", "eslint" },
			javascriptreact = { "prettier", "eslint" },
			typescript = { "prettier", "eslint" },
			typescriptreact = { "prettier", "eslint" },

			-- use a sub-list to run conform until a formatter is found
			-- javascript = { { "prettierd", "prettier" } },
		},
	},
}
