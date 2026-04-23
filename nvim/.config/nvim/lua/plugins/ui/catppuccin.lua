return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				custom_highlights = function(colors)
					return {
						Folded = { bg = "NONE", fg = colors.overlay1, italic = true },
						Normal = { bg = "NONE" },
						NormalNC = { bg = "NONE" },
            NormalFloat = { bg = colors.mantle },
						SignColumn = { bg = "NONE" },
						LineNr = { bg = "NONE" },
						CursorLineNr = { bg = "NONE" },
						StatusLine = { bg = "NONE" },
						TabLine = { bg = "NONE" },
						TabLineFill = { bg = "NONE" },

						-- Floating window borders
						FloatBorder = { fg = colors.lavender, bg = "NONE" },
						FloatTitle = { fg = colors.mauve, bg = "NONE", bold = true },

						-- Lazy specifically
						LazyNormal = { bg = "NONE" },
						LazyBorder = { fg = colors.lavender, bg = "NONE" },

						-- LSP hover / signature help
						LspInfoBorder = { fg = colors.lavender, bg = "NONE" },
					}
				end,
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	--[[  return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                custom_highlights = function(colors)
                    return {
                        Folded = { bg = "NONE", fg = colors.overlay1, italic = true },
                    }
                end,
            })
            vim.cmd.colorscheme("catppuccin")
        end,
    },
  } ]]
	--
}
