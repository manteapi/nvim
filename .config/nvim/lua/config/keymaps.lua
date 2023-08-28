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
