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
