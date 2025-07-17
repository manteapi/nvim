require("oil").setup({})

vim.keymap.set("n", "<Leader>e", ":Oil<cr>", {silent = true, noremap = true, desc = "Edit filesystem in a buffer"})
