require('telescope').setup{
	defaults = {
		path_display={
            shorten = {
                len = 1,
                exclude = {-1, -2, -3}
            }
        } 
	}
}

builtin = require('telescope.builtin')

local opts = { noremap = true }

vim.keymap.set("n", "<Leader>tb", builtin.buffers, opts)
vim.keymap.set("n", "<Leader>tg", builtin.live_grep, opts)
vim.keymap.set("n", "<Leader>tf", builtin.find_files, opts)
vim.keymap.set("n", "<Leader>th", builtin.help_tags, opts)
vim.keymap.set("n", "<Leader>tk", builtin.keymaps, opts)
vim.keymap.set("n", "<Leader>ts", builtin.lsp_document_symbols, opts)
vim.keymap.set("n", "<Leader>tr", builtin.lsp_references, opts)
vim.keymap.set("n", "<Leader>tw", builtin.lsp_dynamic_workspace_symbols, opts)
vim.keymap.set("n", "<Leader>tm", builtin.marks, opts)

vim.keymap.set("n", "<Leader>tc", function()
    require("telescope.builtin").find_files({
        cwd = "~/repositories/dotfiles/nvim/",
    })
end, opts)

vim.keymap.set("n", "<Leader>tn", function()
    require("telescope.builtin").find_files({
        cwd = "~/repositories/dotfiles/neo-notes/",
    })
end, opts)
