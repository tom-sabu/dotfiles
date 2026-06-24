local startify = require("alpha.themes.startify")
startify.file_icons.provider = "devicons"

local function set_hl()
    local highlights = {
        AlphaHeader     = { fg = "#cba6f7", bold = true },
        AlphaFooter     = { fg = "#6c7086", italic = true },
        AlphaButtons    = { fg = "#89b4fa" },
        AlphaShortcut   = { fg = "#a6e3a1", bold = true },
        StartifyHeader  = { fg = "#cba6f7", bold = true },
        StartifyFooter  = { fg = "#6c7086", italic = true },
        StartifyFile    = { fg = "#cdd6f4" },
        StartifyPath    = { fg = "#6c7086" },
        StartifySlash   = { fg = "#585b70" },
        StartifySection = { fg = "#89b4fa", bold = true },
        StartifyBracket = { fg = "#585b70" },
        StartifyNumber  = { fg = "#fab387", bold = true },
        StartifySpecial = { fg = "#f38ba8" },
        StartifySelect  = { fg = "#a6e3a1" },
    }
    for group, opts in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, opts)
    end
end

vim.api.nvim_create_autocmd("ColorScheme", { pattern = "*", callback = set_hl })
vim.defer_fn(set_hl, 0)

require("alpha").setup(startify.config)
