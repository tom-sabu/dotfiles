return {
	-------------------------------------------------------------
	-- nvim-dap (core)
	-------------------------------------------------------------
	{
		"mfussenegger/nvim-dap",
		dependencies = { "nvim-neotest/nvim-nio" },
		config = function()
			local dap = require("dap")
			local mason = vim.fn.stdpath("data") .. "/mason/packages"
			---------------------------------------------------------
			-- PYTHON (debugpy from Mason)
			---------------------------------------------------------
			dap.adapters.python = {
				type = "executable",
				command = mason .. "/debugpy/venv/bin/python",
				args = { "-m", "debugpy.adapter" },
			}
			dap.configurations.python = {
				{
					type = "python",
					request = "launch",
					name = "Launch Python file",
					program = "${file}",
					console = "integratedTerminal",
				},
			}
			---------------------------------------------------------
			-- C / C++ / Rust (codelldb from Mason)
			---------------------------------------------------------
			local codelldb_path = vim.fn.stdpath("data") .. "/mason/packages/codelldb/codelldb"

			dap.adapters.codelldb = {
				type = "server",
				port = "${port}",
				executable = {
					command = codelldb_path,
					args = { "--port", "${port}" },
				},
			}

			local lldb_config = {
				name = "Debug executable",
				type = "codelldb",
				request = "launch",
				program = function()
					-- First try to find common executable names in current directory
					local cwd = vim.fn.getcwd()
					local possible_exes = {
						cwd .. "/a.out",
						cwd .. "/sample",
						cwd .. "/main",
						cwd .. "/program",
					}

					-- Check if any exist
					for _, exe in ipairs(possible_exes) do
						if vim.fn.filereadable(exe) == 1 then
							return exe
						end
					end

					-- If none found, prompt user with full path
					local file = vim.fn.input({
						prompt = "Path to executable: ",
						default = cwd .. "/",
						completion = "file",
					})
					return file
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			}

			dap.configurations.cpp = { lldb_config }
			dap.configurations.c = { lldb_config }
			dap.configurations.rust = { lldb_config }
			---------------------------------------------------------
			-- KOTLIN (kotlin-debug-adapter from Mason)
			---------------------------------------------------------
			dap.adapters.kotlin = {
				type = "executable",
				command = vim.fn.stdpath("data") .. "/mason/bin/kotlin-debug-adapter",
			}

			dap.configurations.kotlin = {
				{
					type = "kotlin",
					request = "launch",
					name = "Launch Kotlin Desktop App",
					projectRoot = "${workspaceFolder}",
					mainClass = function()
						return vim.fn.input({
							prompt = "Main Class (e.g. com.example.MainKt): ",
							default = "",
						})
					end,
				},
				{
					type = "kotlin",
					request = "attach",
					name = "Attach to Android Debugger",
					hostName = "localhost",
					port = 5005,
					timeout = 2000,
				},
			}
			---------------------------------------------------------
			-- KEYMAPS (ESSENTIAL)
			---------------------------------------------------------
			local map = vim.keymap.set
			-- Basic debugging
			map("n", "<F5>", function()
				dap.continue()
			end, { desc = "Start/Continue Debugging" })
			map("n", "<F10>", function()
				dap.step_over()
			end, { desc = "Step Over" })
			map("n", "<F11>", function()
				dap.step_into()
			end, { desc = "Step Into" })
			map("n", "<F12>", function()
				dap.step_out()
			end, { desc = "Step Out" })
			-- Breakpoints
			map("n", "<Leader>b", function()
				dap.toggle_breakpoint()
			end, { desc = "Toggle Breakpoint" })
			map("n", "<Leader>B", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, { desc = "Set Conditional Breakpoint" })
			-- REPL & last session
			map("n", "<Leader>dr", function()
				dap.repl.open()
			end, { desc = "Open REPL" })
			map("n", "<Leader>dl", function()
				dap.run_last()
			end, { desc = "Run Last Debug Session" })
		end,
	},
	-------------------------------------------------------------
	-- DAP UI (side panels, scopes, breakpoints, stacks)
	-------------------------------------------------------------
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			-- Auto open / close debug UI
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
}
