return {
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local startify = require("alpha.themes.startify")
      startify.file_icons.provider = "devicons"

      local function set_hl()
        local highlights = {
          AlphaHeader        = { fg = "#cba6f7", bg = "NONE", bold = true },
          AlphaFooter        = { fg = "#6c7086", bg = "NONE", italic = true },
          AlphaButtons       = { fg = "#89b4fa", bg = "NONE" },
          AlphaShortcut      = { fg = "#a6e3a1", bg = "NONE", bold = true },
          AlphaHeaderLabel   = { fg = "#cba6f7", bg = "NONE" },
          StartifyHeader     = { fg = "#cba6f7", bg = "NONE", bold = true },
          StartifyFooter     = { fg = "#6c7086", bg = "NONE", italic = true },
          StartifyFile       = { fg = "#cdd6f4", bg = "NONE" },
          StartifyPath       = { fg = "#6c7086", bg = "NONE" },
          StartifySlash      = { fg = "#585b70", bg = "NONE" },
          StartifySection    = { fg = "#89b4fa", bg = "NONE", bold = true },
          StartifyBracket    = { fg = "#585b70", bg = "NONE" },
          StartifyNumber     = { fg = "#fab387", bg = "NONE", bold = true },
          StartifySpecial    = { fg = "#f38ba8", bg = "NONE" },
          StartifySelect     = { fg = "#a6e3a1", bg = "NONE" },
        }
        for group, opts in pairs(highlights) do
          vim.api.nvim_set_hl(0, group, opts)
        end
      end

      -- Defer until after colorscheme loads
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = set_hl,
      })

      -- Also fire immediately but after the event loop settles
      vim.defer_fn(set_hl, 0)

      require("alpha").setup(startify.config)
    end,
  },
}
