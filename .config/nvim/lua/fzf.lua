-- i decided to give Telescope a try
vim.cmd([[let $FZF_DEFAULT_COMMAND = 'fd --hidden .']])

local opts = { noremap = true }
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>:Rg<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>fa", "<cmd>:Ag<cr>", opts)

-- vim.cmd([[
-- function! RipgrepFzf(query, fullscreen)
--   let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
--   let initial_command = printf(command_fmt, shellescape(a:query))
--   let reload_command = printf(command_fmt, '{q}')
--   let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
--   call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
-- endfunction
-- 
-- command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
-- ]])
