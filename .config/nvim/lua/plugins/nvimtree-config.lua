vim.g.nvim_tree_respect_buf_cwd=1

require'nvim-tree'.setup {
    update_cwd = true,
    update_focused_file = {
        enable      = true,
        update_cwd  = true,
    }
}

local opts = {noremap=true, silent=true}
vim.api.nvim_set_keymap("n", "<C-n>", "<cmd>:NvimTreeToggle<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>:NvimTreeFocus<CR>", opts)
