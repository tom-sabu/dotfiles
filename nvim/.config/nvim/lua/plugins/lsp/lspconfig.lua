-- LSP Configuration
-- Language Server Protocol setup and keybindings

return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Disable semantic tokens
			vim.lsp.semantic_tokens.enable = false

			-- Completion capabilities
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Global LSP keybindings
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local opts = { buffer = ev.buf }

					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

					vim.keymap.set("n", "<leader>f", function()
						vim.lsp.buf.format({ async = true })
					end, opts)
				end,
			})

			-- lua_ls
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						telemetry = { enable = false },
					},
				},
			})

			-- clangd
			vim.lsp.config("clangd", {
				capabilities = capabilities,
			})

			-- kotlin_language_server
			vim.lsp.config("kotlin_language_server", {
				capabilities = capabilities,
			})

			-- Enable servers
			vim.lsp.enable({
				"lua_ls",
				"clangd",
				"basedpyright",
				"kotlin_language_server",
			})
		end,
	},
}
