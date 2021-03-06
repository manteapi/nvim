vim.o.termguicolors = true

require("bufferline").setup{}

local opts = {noremap=true, silent=true}
vim.api.nvim_set_keymap("n", "bl", "<cmd>:BufferLineCycleNext<CR>", opts)
vim.api.nvim_set_keymap("n", "bh", "<cmd>:BufferLineCyclePrev<CR>", opts)
vim.api.nvim_set_keymap("n", "gb", "<cmd>:BufferLinePick<CR>", opts)
vim.api.nvim_set_keymap("n", "bx", "<cmd>:BufferLinePickClose<CR>", opts)
