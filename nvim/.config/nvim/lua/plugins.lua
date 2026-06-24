-- ~/.config/nvim-new/lua/plugins.lua
vim.pack.add({
    --mason
    { src = "https://github.com/mason-org/mason.nvim" },

    --completion
    { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },

    --color scheme
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },

    --fzf
    { src = "https://github.com/ibhagwan/fzf-lua" },

    --git
    { src = "https://github.com/kdheepak/lazygit.nvim" },
    "https://github.com/nvim-lua/plenary.nvim",

    --neo-tree
    {
      src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',
      version = vim.version.range('3')
    },
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/MunifTanjim/nui.nvim",
    "https://github.com/nvim-tree/nvim-web-devicons",

    -- alpha
    { src = "https://github.com/goolord/alpha-nvim" },
    "https://github.com/nvim-tree/nvim-web-devicons",

    --indent blnkline
    { src = "https://github.com/lukas-reineke/indent-blankline.nvim" },

    --lua line
    { src = "https://github.com/nvim-lualine/lualine.nvim" },

})

local plugins = {
    "alpha",
    "catppuccin",
    "lualine",
    "neotree",
    "ibl",
    "mason",
    "blink",
    "fzf",
}

for _, name in ipairs(plugins) do
    require("plugins." .. name)
end

