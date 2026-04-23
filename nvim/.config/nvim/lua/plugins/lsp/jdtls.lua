return {
	{
		"mfussenegger/nvim-jdtls",
		ft = { "java" }, -- only load for Java files
		config = function()
			local mason = vim.fn.stdpath("data") .. "/mason/packages"

			-- Paths to Mason-installed tools
			local jdtls_path = mason .. "/jdtls"
			local debug_adapter_jar = vim.fn.glob(
				mason .. "/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"
			)
			local java_test_jars = vim.fn.glob(
				mason .. "/java-test/extension/server/*.jar",
				true,
				true
			)

			-- Build bundles list (debug + test JARs)
			local bundles = {}
			if debug_adapter_jar ~= "" then
				table.insert(bundles, debug_adapter_jar)
			end
			vim.list_extend(bundles, java_test_jars)

			-- Workspace dir (separate per project)
			local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
			local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. project_name

			local config = {
				cmd = {
					"java",
					"-Declipse.application=org.eclipse.jdt.ls.core.id1",
					"-Dosgi.bundles.defaultStartLevel=4",
					"-Declipse.product=org.eclipse.jdt.ls.core.product",
					"-Dlog.level=ALL",
					"-Xmx1g",
					"--add-modules=ALL-SYSTEM",
					"--add-opens", "java.base/java.util=ALL-UNNAMED",
					"--add-opens", "java.base/java.lang=ALL-UNNAMED",
					"-jar", vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
					"-configuration", jdtls_path .. "/config_linux",
					"-data", workspace_dir,
				},

				root_dir = require("jdtls.setup").find_root({
					".project", ".classpath", ".git", "mvnw", "gradlew", "pom.xml", "build.gradle",
				}),

				settings = {
					java = {
						signatureHelp = { enabled = true },
						completion = {
							favoriteStaticMembers = {
								"org.junit.Assert.*",
								"org.junit.Assume.*",
								"org.hamcrest.MatcherAssert.assertThat",
							},
						},
					},
				},

				-- Wire up the debug adapter bundles
				init_options = {
					bundles = bundles,
				},

				on_attach = function(_, bufnr)
					-- Enable nvim-jdtls DAP
					require("jdtls").setup_dap({ hotcodereplace = "auto" })
					require("jdtls.dap").setup_dap_main_class_configs()

					-- Java-specific keymaps
					local map = function(key, fn, desc)
						vim.keymap.set("n", key, fn, { buffer = bufnr, desc = desc })
					end

					map("<leader>jo", require("jdtls").organize_imports, "Organize Imports")
					map("<leader>jv", require("jdtls").extract_variable, "Extract Variable")
					map("<leader>jm", require("jdtls").extract_method, "Extract Method")
					map("<leader>jt", require("jdtls.dap").test_nearest_method, "Test Nearest Method")
					map("<leader>jT", require("jdtls.dap").test_class, "Test Class")
				end,
			}

			-- Start / attach JDTLS
			require("jdtls").start_or_attach(config)
		end,
	},
}
