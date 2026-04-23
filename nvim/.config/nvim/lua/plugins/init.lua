-- Plugin specification loader
-- Automatically loads all plugin specs from subdirectories

return {
	{ import = "plugins.lsp" },
	{ import = "plugins.completion" },
	{ import = "plugins.editor" },
	{ import = "plugins.ui" },
	{ import = "plugins.tools" },
}
