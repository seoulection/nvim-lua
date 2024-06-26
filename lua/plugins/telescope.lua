return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{
			"nvim-telescope/telescope-live-grep-args.nvim",
			-- This will not install any breaking changes.
			-- For major updates, this must be adjusted manually.
			version = "^1.0.0",
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },

		-- useful icons, requires nerd font
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	config = function()
		-- see `:help telescope` and `:help telescope.setup()`
		require("telescope").setup({
			defaults = {
				mappings = {
					i = { ["<Esc>"] = require("telescope.actions").close },
				},
				path_display = { truncate = 2 },
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})
		require("telescope").load_extension("live_grep_args")

		-- enable telescope extensions if they are installed
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")

		-- see `:help telescope.builtin`
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
		vim.keymap.set("n", "<C-t>", builtin.find_files, { desc = "Search files" })
		vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
		vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
		vim.keymap.set("n", "<C-i>", builtin.grep_string, { desc = "Search current word" })
		vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
		vim.keymap.set(
			"n",
			"<C-g>",
			":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
			{ desc = "Search by grep" }
		)
		vim.keymap.set(
			"n",
			"<leader>sg",
			":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
			{ desc = "[S]earch by [G]rep" }
		)
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
		vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
		vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
		vim.keymap.set("n", "<C-u>", builtin.current_buffer_fuzzy_find, { desc = "Fuzzily search in current buffer" })
		vim.keymap.set(
			"n",
			"<leader>/",
			builtin.current_buffer_fuzzy_find,
			{ desc = "[/] Fuzzily search in current buffer" }
		)

		--  see `:help telescope.builtin.live_grep()` for information about particular keys
		vim.keymap.set("n", "<C-y>", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "Live grep in open files" })

		vim.keymap.set("n", "<leader>s/", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "[S]earch [/] in Open Files" })

		vim.keymap.set("n", "<leader>sn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[S]earch [N]eovim files" })

		-- go to definition in vertical split
		vim.keymap.set("n", "<C-o>", function()
			builtin.lsp_definitions({ jump_type = "vsplit" })
		end)
	end,
}
