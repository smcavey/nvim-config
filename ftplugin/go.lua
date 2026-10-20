-- This code runs automatically ONLY when a .go file is opened

-- 1. Standard Go formatting
vim.opt_local.expandtab = false
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4

-- 2. Robust Treesitter Code Folding
vim.opt_local.foldmethod = "expr"
vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt_local.foldlevel = 99 -- Keep folds open by default

-- 3. The Fix: Force Neovim to recalculate folds when Treesitter is ready
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
  buffer = vim.api.nvim_get_current_buf(),
  callback = function()
    vim.cmd("silent! loadview")
    vim.cmd("normal! zX") -- Forces Neovim to rebuild the fold structures
  end,
})

