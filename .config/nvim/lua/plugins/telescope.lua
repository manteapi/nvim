require("telescope").setup({})

builtin = require('telescope.builtin')

local opts = { noremap = true }

vim.keymap.set("n", "<leader>tb", builtin.buffers, opts)
vim.keymap.set("n", "<leader>tf", builtin.git_files, opts)
vim.keymap.set("n", "<leader>th", builtin.help_tags, opts)
vim.keymap.set("n", "<leader>tk", builtin.keymaps, opts)

vim.keymap.set("n", "<leader>tn", function()
	require("telescope.builtin").find_files({
		cwd = "~/repositories/dotfiles/nvim/",
	})
end, opts)
