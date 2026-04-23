return {
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			-- Set a softer highlight color for the active scope
			vim.api.nvim_set_hl(0, "IblScope", {
				fg = "#5a5a5a", -- change this to your preferred muted color
			})

			require("ibl").setup({
				scope = {
					enabled = true,
					show_start = true,
					show_end = true,
					highlight = "IblScope",
				},
			})
		end,
	},
}
