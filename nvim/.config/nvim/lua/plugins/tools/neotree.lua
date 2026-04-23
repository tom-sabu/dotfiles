return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("neo-tree").setup({
        filesystem = {
          follow_current_file = {
            enabled = true,
          },
        },
        default_component_configs = {
          indent = {
            indent_marker      = "│",
            last_indent_marker = "└",
          },
        },
        event_handlers = {
          {
            event = "neo_tree_buffer_enter",
            handler = function()
              local highlights = {
                -- Base
                NeoTreeNormal         = { bg = "NONE" },
                NeoTreeNormalNC       = { bg = "NONE" },
                NeoTreeEndOfBuffer    = { bg = "NONE" },
                NeoTreeWinSeparator   = { fg = "#313244", bg = "NONE" }, -- surface0

                -- Header / title
                NeoTreeRootName       = { fg = "#cba6f7", bold = true }, -- mauve
                NeoTreeHeaderLabel    = { fg = "#cba6f7" },

                -- File / directory entries
                NeoTreeFileName       = { fg = "#cdd6f4" },              -- text
                NeoTreeFileNameOpened = { fg = "#89b4fa", bold = true }, -- blue
                NeoTreeDirectory      = { fg = "#89b4fa", bold = true }, -- blue
                NeoTreeDirectoryIcon  = { fg = "#89b4fa" },
                NeoTreeSymbolicLinkTarget = { fg = "#94e2d5" },          -- teal

                -- Git status
                NeoTreeGitAdded       = { fg = "#a6e3a1" },              -- green
                NeoTreeGitModified    = { fg = "#fab387" },              -- peach
                NeoTreeGitDeleted     = { fg = "#f38ba8" },              -- red
                NeoTreeGitUntracked   = { fg = "#f9e2af" },              -- yellow
                NeoTreeGitIgnored     = { fg = "#585b70" },              -- surface2
                NeoTreeGitConflict    = { fg = "#f38ba8", bold = true },
                NeoTreeGitStaged      = { fg = "#a6e3a1", bold = true },

                -- Indent markers
                NeoTreeIndentMarker   = { fg = "#45475a" },              -- surface1
                NeoTreeExpander       = { fg = "#6c7086" },              -- overlay0

                -- Dimmed / hidden
                NeoTreeDimText        = { fg = "#585b70" },
                NeoTreeHiddenByName   = { fg = "#585b70" },

                -- Floating border (for neo-tree popups)
                NeoTreeFloatBorder    = { fg = "#89b4fa", bg = "NONE" },
                NeoTreeFloatTitle     = { fg = "#cba6f7", bg = "NONE", bold = true },
              }
              for group, opts in pairs(highlights) do
                vim.api.nvim_set_hl(0, group, opts)
              end
            end,
          },
        },
      })
    end,
  },
}
