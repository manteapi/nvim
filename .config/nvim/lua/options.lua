local options = {
	timeoutlen = 400, -- time in milliseconds to wait for a mapped sequence to complete.
	showmatch = true, -- show matching
	ignorecase = true, -- case insensitive
	mouse = "va", -- a="enable mouse click" + v="middle-click paste"
	hlsearch = false, -- highlight search
	tabstop = 4, -- number of columns occupied by a tab
	softtabstop = 4, -- see multiple spaces as tabstops so <BS> does the right thing
	expandtab = true, -- converts tabs to white space
	shiftwidth = 4, -- width for autoindents
	autoindent = true, -- indent a new line the same amount as the line just typed
	number = true, -- add line numbers
	wildmode = { "longest", "list" }, -- get bash-like tab completions
	clipboard = "unnamedplus", -- using system clipboard
	cursorline = true, -- highlight current cursorline
	ttyfast = true, -- Speed up scrolling in Vim
	breakindent = true, -- Enable breakindent
	grepformat = "%f:%l:%c:%m",
	grepprg = "rg --vimgrep --hidden --no-heading --smart-case",
	relativenumber = true, -- Show relative line number
	signcolumn = "yes", -- Always show signcolumn
	autoread = true, -- Detect when a file has been changed and load it again
	directory = vim.fn.expand("$HOME", "", "") .. "/.local/share/nvim/swap", -- NOTE: Required on my encrypted filesystem, dunno why
    spell = true,
    laststatus = 3,
    -- WARNING: Tried 0 but some drawbacks made me turn back. Among them, the fact that I do not know when I record a macro
    cmdheight = 1
}


for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.o.ignorecase = false
vim.o.smartcase = true

vim.o.updatetime = 250 --Decrease update time

vim.wo.signcolumn = "yes" -- Always show signcolumn

vim.g.do_filetype_lua = 1

vim.g.matchparen_timeout = 12 -- time in ms to find matching parenthesis
vim.g.matchparen_insert_timeout = 12 -- time ins ms to find matching parenthesis in insert mode

--Remap space as leader key
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})
