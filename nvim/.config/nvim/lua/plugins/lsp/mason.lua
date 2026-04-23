-- Mason and Mason-LSPConfig
-- Manages LSP server installations

return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {
			ensure_installed = {
				"lua_ls",
				"clangd",
				"basedpyright",
				"kotlin_language_server",
			},
		},
	},
}
