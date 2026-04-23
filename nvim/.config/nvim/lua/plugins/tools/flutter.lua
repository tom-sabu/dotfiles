return {
	{
		"akinsho/flutter-tools.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim", -- optional for vim.ui.select
		},
		config = function()
			require("flutter-tools").setup({
				debugger = {
					enabled = true,
					run_via_dap = true,
					register_configurations = function(_)
						local dap = require("dap")
						dap.configurations.dart = {}
						require("dap.ext.vscode").load_launchjs()
					end,
				},
				lsp = {
					color = {
						enabled = true,
					},
					settings = {
						showTodos = true,
						completeFunctionCalls = true,
					},
				},
			})

			-- Telescope extension loader
			require("telescope").load_extension("flutter")
		end,
	},

	{
		"stevearc/dressing.nvim",
		opts = {},
	},
}
