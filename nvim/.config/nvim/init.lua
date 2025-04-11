local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("vim-options")
require("lazy").setup("plugins")
-- note: the order of above plugins shouldn't be changed

-- Load custom modules
require("myconfig.quit-confirm")

local lsp_on_attach = require("myconfig.on-save")

vim.api.nvim_create_autocmd("LspAttach", {
  callback = lsp_on_attach.on_attach,
})
