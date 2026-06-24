local hooks = require("ibl.hooks")

local highlight = {
    "IblIndent1",
    "IblIndent2",
    "IblIndent3",
    "IblIndent4",
    "IblIndent5",
    "IblIndent6",
}

hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    -- catppuccin mocha palette, dimmed for subtlety
    vim.api.nvim_set_hl(0, "IblIndent1", { fg = "#45475a" })    -- surface1 (neutral)
    vim.api.nvim_set_hl(0, "IblIndent2", { fg = "#6a6a9a" }) -- lavender, dimmed
    vim.api.nvim_set_hl(0, "IblIndent3", { fg = "#4a6a72" }) -- sky, dimmed
    vim.api.nvim_set_hl(0, "IblIndent4", { fg = "#4a6a4a" }) -- green, dimmed
    vim.api.nvim_set_hl(0, "IblIndent5", { fg = "#7a5a3a" }) -- peach, dimmed
    vim.api.nvim_set_hl(0, "IblIndent6", { fg = "#6a5a7a" }) -- mauve, dimmed
end)

require("ibl").setup({
    indent = {
        char = "│",
        highlight = highlight,
    },
    scope = { enabled = false },
})
