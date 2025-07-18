require("nvim-tree").setup({
        respect_buf_cwd = true,
        update_focused_file = {
            enable = true,
            update_root = true,
            ignore_list = {},
        },
    }
)

vim.keymap.set("n", "<Leader>E", ":NvimTreeToggle<cr>", {silent = true, noremap = true, desc = "Explore filesystem"})
vim.keymap.set("n", "<Leader>t", ":NvimTreeFocus<cr>", {silent = true, noremap = true, desc = "Explore filesystem"})
