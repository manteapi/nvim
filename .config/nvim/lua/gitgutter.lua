local options = {
	signcolumn="yes" --this also removes the jitter when warnings/errors flow in
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd([[let g:gitgutter_override_sign_column_highlight = 0]])

vim.cmd([[highlight SignColumn ctermbg=black]])
vim.cmd([[highlight GitGutterAdd    cterm=bold ctermfg=green]])   	-- an added line
vim.cmd([[highlight GitGutterChange cterm=bold ctermfg=blue]])   		-- a changed line
vim.cmd([[highlight GitGutterDelete cterm=bold ctermfg=red]]) 		-- at leat one removed line
vim.cmd([[highlight GitGutterChangeDelete cterm=bold ctermfg=red]]) 	-- a changed line followed by at least one removed line
