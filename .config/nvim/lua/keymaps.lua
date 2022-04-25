-- Copied from https://vim.fandom.com/wiki/Search_for_visually_selected_text#Simple

-- Search for selected text, forwards or backwards.
vim.cmd([[vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>]])

vim.cmd([[vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>]])

vim.keymap.set("n", "<leader><leader>r", function()
    vim.notify = require("notify")
    local reload = require "plenary.reload"
    reload.reload_module('%')
    vim.cmd([[luafile %]])
    vim.notify({"Lua file reloaded !"}, "info")
end)
