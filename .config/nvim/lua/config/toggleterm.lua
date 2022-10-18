require("toggleterm").setup({
	direction = "float",
})

function _G.set_terminal_keymaps()
	local bufopts = { noremap = true, buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], bufopts)
	vim.keymap.set("t", "jk", [[<C-\><C-n>]], bufopts)
	vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-W>h]], bufopts)
	vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-W>j]], bufopts)
	vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-W>k]], bufopts)
	vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-W>l]], bufopts)
	vim.keymap.set("t", "<C-t>", "<cmd>:ToggleTerm<CR>", bufopts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
vim.cmd("autocmd BufWinEnter,WinEnter term://* startinsert")

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<C-t>", "<cmd>:ToggleTerm<CR>", opts)
