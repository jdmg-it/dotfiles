return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"nvim-telescope/telescope.nvim",
		-- branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-tree/nvim-web-devicons",
			"folke/todo-comments.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local fb_actions = require("telescope").extensions.file_browser.actions

			telescope.setup({
				defaults = {
					path_display = { "smart" },
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous, -- move to prev result
							["<C-j>"] = actions.move_selection_next, -- move to next result
							["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						},
					},
				},
				extensions = {
					fzf = {
						override_generic_sorter = false, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
					},
					file_browser = {
						theme = "dropdown",
						-- disables netrw and use telescope-file-browser in its place
						hijack_netrw = true,
						mappings = {
							-- your custom insert mode mappings
							["n"] = {
								-- your custom normal mode mappings
								["N"] = fb_actions.create,
								["h"] = fb_actions.goto_parent_dir,
								["<C-u>"] = function(prompt_bufnr)
									for i = 1, 10 do
										actions.move_selection_previous(prompt_bufnr)
									end
								end,
								["<C-d>"] = function(prompt_bufnr)
									for i = 1, 10 do
										actions.move_selection_next(prompt_bufnr)
									end
								end,
							},
						},
					},
				},
			})

			telescope.load_extension("fzf")
			telescope.load_extension("file_browser")

			-- set keymaps
			local keymap = vim.keymap -- for conciseness

			keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
			keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
			keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
			keymap.set(
				"n",
				"<leader>fc",
				"<cmd>Telescope grep_string<cr>",
				{ desc = "Find string under cursor in cwd" }
			)
			keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
		end,
	},
}
