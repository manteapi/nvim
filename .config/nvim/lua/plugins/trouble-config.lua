require("trouble").setup()

local opts = {noremap=true, silent=true}
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>TroubleToggle<CR>", opts)
