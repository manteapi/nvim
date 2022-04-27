require('spectre').setup({
    highlight = {
        ui = "String",
        search = "TodoBgFIX",
        replace = "TodoBgNOTE"
    },
})

local opts = {noremap=true, silent=true}

vim.api.nvim_set_keymap("n", "<leader>rw", "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>rv", "<cmd>lua require('spectre').open_visual()<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>R", "<cmd>lua require('spectre').open()<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>rf", "<cmd>lua require('spectre').open_file_search()<cr>", opts)
