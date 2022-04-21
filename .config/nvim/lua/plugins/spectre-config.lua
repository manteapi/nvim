require('spectre').setup({})

local opts = {noremap=true, silent=true}

vim.api.nvim_set_keymap("n", "<leader>sw", "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>s", "<cmd>lua require('spectre').open_visual()<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>S", "<cmd>lua require('spectre').open()<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>sp", "<cmd>lua require('spectre').open_file_search()<cr>", opts)
