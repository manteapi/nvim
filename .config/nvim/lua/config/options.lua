-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.clipboard = "unnamedplus" -- using system clipboard -> allow to copy-paste from/to outside/inside neovim

vim.opt.cmdheight = 0 -- set the cmd line height

vim.opt.tabstop = 4 -- number of columns occupied by a tab
vim.opt.shiftwidth = 4 -- number of columns for an indent level
vim.opt.softtabstop = 4 -- number of columns when tab or backspace are pressed
vim.opt.expandtab = true -- converts tabs to whitespace
vim.opt.shiftround = true -- rounds the indent spacing to the next multiple of shiftwidth -> easier indent when using `>`, `<`

vim.opt.ignorecase = true -- search is case insentitive
vim.opt.smartcase = true -- search can dynamically become case sensitive

vim.opt.autoread = true -- detect when a file has been changed and load it again

vim.opt.number = true -- display line numbers
vim.opt.relativenumber = true -- display relative line number

vim.opt.signcolumn = "yes" -- always show signcolumn

vim.opt.hlsearch = false -- do not highlight search
vim.opt.incsearch = true -- enable incremental search

vim.opt.spell = true -- enable spell check

vim.opt.foldmethod="indent"
vim.opt.foldlevelstart=20

vim.opt.termguicolors = true

--Remap space as leader key
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = ","
