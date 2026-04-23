return {
  "kdheepak/lazygit.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },

  keys = {
    { "<leader>lg", "<cmd>LazyGit<CR>", desc = "Open LazyGit" },
  },

  config = function()
    vim.g.lazygit_floating_window_use_plenary = 1
    vim.g.lazygit_floating_window_scaling_factor = 0.88
    vim.g.lazygit_floating_window_corner_chars = { "╭", "╮", "╰", "╯" }
  end,
}

