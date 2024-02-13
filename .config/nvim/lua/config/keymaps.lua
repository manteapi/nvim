local raw_notify = require("utils.raw_notify").notify

vim.keymap.set("n", "<Leader><Leader>",
function()
	local current_file = vim.fn.expand("%:p", "", "")
	if vim.bo.filetype == "lua" then
        vim.cmd([[:silent! write]])
        vim.cmd([[:luafile %]])
		raw_notify(" " .. current_file .. " reloaded !", "achieve")
	else
		raw_notify("" .. current_file .. " could not be loaded !", "error")
	end
end, { desc = "Source current file", silent = true })

vim.keymap.set("n", "<Leader>b", ":bdelete<CR>", { silent = true, desc = "Delete current buffer" })
vim.keymap.set("n", "<Leader>B", ":bdelete!<CR>", { silent = true, desc = "Force current buffer deletion" })

vim.keymap.set("n", "<Leader>ss", ":set spell!<CR>", { desc = "Toggle spelling", silent = true })

vim.keymap.set("n", "<Leader>e", ":Ex<CR><CR>", { desc = "Open Netrw", silent = true })

vim.keymap.set("t", "<Leader><Esc>", ":<C-\\><C-n>", { desc = "Leave terminal mode", silent = true, noremap = true })
vim.keymap.set("t", "<A-h>", "<C-\\><C-N><C-w>h", {desc = "Switch to left window", silent = true, noremap = true })
vim.keymap.set("t", "<A-j>", "<C-\\><C-N><C-w>j", {desc = "Switch to bottom window", silent = true, noremap = true })
vim.keymap.set("t", "<A-k>", "<C-\\><C-N><C-w>k", {desc = "Switch to top window", silent = true, noremap = true })
vim.keymap.set("t", "<A-l>", "<C-\\><C-N><C-w>l", {desc = "Switch to right window", silent = true, noremap = true })

vim.keymap.set("n", "<Leader>s", ":%s/<C-r><C-w>//gc<Left><Left><Left>", {desc = "Search/Replace word under cursor", silent = true, noremap = true})
