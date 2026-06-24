require("neo-tree").setup({
  close_if_last_window = true,
  popup_border_style = "NC",
  enable_git_status = true,
  enable_diagnostics = true,
  open_files_do_not_replace_types = { "terminal", "trouble", "qf" },

  default_component_configs = {
    indent = {
      indent_size = 2,
      padding = 1,
    },
    git_status = {
      symbols = {
        added     = "",
        modified  = "",
        deleted   = "✖",
        renamed   = "󰁕",
        untracked = "",
        ignored   = "",
        unstaged  = "󰄱",
        staged    = "",
        conflict  = "",
      },
    },
  },

  window = {
    position = "left",
    width = 40,
    mappings = {
      ["<space>"] = { "toggle_node", nowait = false },
      ["<cr>"]    = "open",
      ["s"]       = "open_vsplit",
      ["S"]       = "open_split",
      ["t"]       = "open_tabnew",
      ["C"]       = "close_node",
      ["z"]       = "close_all_nodes",
      ["a"]       = "add",
      ["A"]       = "add_directory",
      ["d"]       = "delete",
      ["r"]       = "rename",
      ["y"]       = "copy_to_clipboard",
      ["x"]       = "cut_to_clipboard",
      ["p"]       = "paste_from_clipboard",
      ["m"]       = "move",
      ["q"]       = "close_window",
      ["R"]       = "refresh",
      ["?"]       = "show_help",
      ["i"]       = "show_file_details",
    },
  },

  filesystem = {
    filtered_items = {
      hide_dotfiles   = true,
      hide_gitignored = true,
    },
    hijack_netrw_behavior = "open_default",
    window = {
      mappings = {
        ["<bs>"] = "navigate_up",
        ["."]    = "set_root",
        ["H"]    = "toggle_hidden",
        ["/"]    = "fuzzy_finder",
        ["f"]    = "filter_on_submit",
        ["[g"]   = "prev_git_modified",
        ["]g"]   = "next_git_modified",
      },
    },
  },

  buffers = {
    follow_current_file = { enabled = true },
    window = {
      mappings = {
        ["d"]    = "buffer_delete",
        ["<bs>"] = "navigate_up",
      },
    },
  },

  git_status = {
    window = {
      position = "float",
      mappings = {
        ["ga"] = "git_add_file",
        ["gu"] = "git_unstage_file",
        ["gr"] = "git_revert_file",
        ["gc"] = "git_commit",
        ["gp"] = "git_push",
        ["gl"] = "git_pull",
        ["A"]  = "git_add_all",
        ["gg"] = "git_commit_and_push",
      },
    },
  },
})
