-- This file contains the configuration for the which-key.nvim plugin in Neovim.

return {
	-- Plugin: which-key.nvim
	-- URL: https://github.com/folke/which-key.nvim
	-- Description: A Neovim plugin that displays a popup with possible keybindings of the command you started typing.
	"folke/which-key.nvim",

	event = "VeryLazy", -- Load this plugin on the 'VeryLazy' event

	opts = {
		preset = "modern",
	},

	init = function()
		-- Set the timeout for key sequences
		vim.o.timeout = true
		vim.o.timeoutlen = 500 -- Set the timeout length to 300 milliseconds
	end,

	keys = {
		{
			-- Keybinding to show which-key popup
			"<leader>?",
			function()
				require("which-key").show({ global = false }) -- Show the which-key popup for local keybindings
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
		{
			-- Keybinding to show which-key popup for global keybindings
			"<leader>¿",
			function()
				require("which-key").show({ global = true }) -- Show the which-key popup for global keybindings
			end,
			desc = "Global Keymaps (which-key)",
		},
	},
}
