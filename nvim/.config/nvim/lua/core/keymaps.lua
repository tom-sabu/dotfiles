-- Centralized keymaps
-- All keybindings organized by category

-- ============================================================================
-- LSP Keymaps
-- ============================================================================
-- Note: LSP keymaps are set in an autocmd when LSP attaches
-- See lua/plugins/lsp/lspconfig.lua for the actual keybindings:
--   gd           - Go to definition
--   gr           - Go to references
--   K            - Hover documentation
--   <leader>rn   - Rename symbol
--   <leader>ca   - Code action
--   <leader>f    - Format buffer

-- ============================================================================
-- Telescope Keymaps
-- ============================================================================
-- Note: Telescope keymaps are set in the plugin config
-- See lua/plugins/tools/telescope.lua for the actual keybindings:
--   <leader>ff   - Find files
--   <leader>fg   - Live grep
--   <leader>fb   - Buffers

-- ============================================================================
-- Neo-tree Keymaps
-- ============================================================================
vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", { desc = "Toggle Neo-tree" })
vim.keymap.set("n", "<C-o>", ":Neotree close<CR>", { desc = "Close Neo-tree" })

-- ============================================================================
-- LazyGit Keymaps
-- ============================================================================
-- Note: LazyGit keymap is defined in the plugin spec using lazy.nvim's keys
-- See lua/plugins/tools/lazygit.lua:
--   <leader>lg   - Open LazyGit

-- ============================================================================
-- General Editor Keymaps
-- ============================================================================
-- Add your custom keymaps here
