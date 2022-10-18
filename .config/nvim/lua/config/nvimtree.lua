require'nvim-tree'.setup {
    respect_buf_cwd = true,
    update_cwd = true,
    update_focused_file = {
        enable      = true,
        update_cwd  = true,
    }
}

local opts = {noremap=true, silent=true}
vim.keymap.set("n", "<C-n>", "<cmd>:NvimTreeToggle<CR>", opts)
vim.keymap.set("n", "<leader>t", "<cmd>:NvimTreeFocus<CR>", opts)
