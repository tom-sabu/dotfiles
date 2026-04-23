-- Core autocommands
local augroup = vim.api.nvim_create_augroup("RememberFolds", { clear = true })

-- Save the view (including folds) when closing a file
vim.api.nvim_create_autocmd("BufWinLeave", {
  group = augroup,
  pattern = "*",
  command = "silent! mkview",
})

-- Load the view (including folds) when opening a file
vim.api.nvim_create_autocmd("BufWinEnter", {
  group = augroup,
  pattern = "*",
  command = "silent! loadview",
})
