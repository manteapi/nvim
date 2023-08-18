vim.opt.clipboard = "unnamedplus" -- using system clipboard -> allow to copy-paste from/to outside/inside neovim

vim.opt.tabstop = 4 -- number of columns occupied by a tab
vim.opt.shiftwidth = 4 -- number of columns for an indent level
vim.opt.softtabstop = 4 -- number of columns when tab or backspace are pressed
vim.opt.expandtab = true -- converts tabs to whitespace
vim.opt.shiftround = true -- rounds the indent spacing to the next multiple of shiftwidth -> easier indent when using `>`, `<`

--Remap space as leader key
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "
