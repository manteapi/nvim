-- Copied from https://vim.fandom.com/wiki/Search_for_visually_selected_text#Simple


vim.keymap.set("n", "<leader><leader>r", function()
    local reload = require "plenary.reload"
    reload.reload_module('%')
    vim.cmd([[luafile %]])
    vim.notify("Lua file reloaded")
end)
