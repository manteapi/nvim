local quickfix_exists = require("utils.helpers").quickfix_exists

local function toggle_quickfix_list()
	local qf_exists = quickfix_exists()
	if qf_exists then
		vim.cmd("cclose")
	else
		vim.cmd("copen")
	end
end

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>ct", function()
	toggle_quickfix_list()
end, opts)
