require("telescope").setup({})

builtin = require('telescope.builtin')

local opts = { noremap = true }
vim.keymap.set("n", "<leader>b", builtin.buffers, opts)
vim.keymap.set("n", "<leader>f", builtin.git_files, opts)
vim.keymap.set("n", "<leader>h", builtin.help_tags, opts)
vim.keymap.set("n", "<leader>k", builtin.keymaps, opts)
