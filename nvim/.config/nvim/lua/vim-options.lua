-- Automatically change directory to the current file's directory
vim.g.mapleader = " "
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.breakindent = true

vim.opt.wrap = false
vim.opt.laststatus = 0
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.env.HOME .. "/.vim/undodir" -- Use vim.env instead of os.getenv
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true

vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
--for navigating vim panes
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
vim.keymap.set("n", "<leader>w", ":update<Return>", { silent = true }) -- Saves the file if changed
vim.keymap.set("n", "<leader>q", ":quit<Return>", { silent = true })   -- Quits the current window
vim.keymap.set("n", "<leader>Q", ":qa<Return>", { silent = true })     -- Quits all windows
vim.opt.updatetime = 50

vim.keymap.set("n", "<A-l>", "5zl")

vim.keymap.set("n", "<A-h>", "5zh")
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")

-- Visual mode: Move selected lines down
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })

-- Visual mode: Move selected lines up
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

vim.api.nvim_create_autocmd("textyankpost", {
  callback = function()
    vim.highlight.on_yank({
      higroup = "incsearch", -- see `:highlight` for more options
      timeout = 200,
    })
  end,
})
