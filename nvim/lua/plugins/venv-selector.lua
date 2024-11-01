return {
	"linux-cultist/venv-selector.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"mfussenegger/nvim-dap",
		"mfussenegger/nvim-dap-python", --optional
		{ "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
	},
	lazy = false,
	branch = "regexp",
	config = function()
		local function shorter_name(filename)
			return filename:gsub(os.getenv("HOME"), "~"):gsub("/bin/python", "")
		end

		require("venv-selector").setup({
			name = { "venv", ".venv" },
			settings = {
				options = {
					on_telescope_result_callback = shorter_name,
				},
			},
		})
	end,
	keys = {
		{ "<leader>vs", "<cmd>VenvSelect<cr>" },
		{ "<leader>vc", "<cmd>VenvSelectCached<cr>" },
	},
}
