require("spectre").setup({
	highlight = {
		ui = "String",
		search = "DiffChange",
		replace = "DiffDelete",
	},
})

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>rw", function()
	require("spectre").open_visual({ select_word = true })
end, opts)
vim.keymap.set("n", "<leader>rv", function()
	require("spectre").open_visual()
end, opts)
vim.keymap.set("n", "<leader>R", function()
	require("spectre").open()
end, opts)
vim.keymap.set("n", "<leader>rf", function()
	require("spectre").open_file_search()
end, opts)
