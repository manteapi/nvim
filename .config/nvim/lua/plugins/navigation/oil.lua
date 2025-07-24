require("oil").setup({
    view_options = {
        show_hidden = true
    }
})

vim.keymap.set("n", "<Leader>e", ":Oil<cr>", { silent = true, noremap = true, desc = "Edit filesystem in a buffer" })
