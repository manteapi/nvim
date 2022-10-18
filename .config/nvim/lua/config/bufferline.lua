vim.o.termguicolors = true

require("bufferline").setup{}

local opts = {noremap=true, silent=true}
vim.keymap.set("n", "bl", "<cmd>:BufferLineCycleNext<CR>", opts)
vim.keymap.set("n", "bh", "<cmd>:BufferLineCyclePrev<CR>", opts)
vim.keymap.set("n", "gb", "<cmd>:BufferLinePick<CR>", opts)
vim.keymap.set("n", "bx", "<cmd>:BufferLinePickClose<CR>", opts)
