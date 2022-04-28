vim.notify = function(msg, level)
    local highlight_group = "AchieveMsg"
    if level == "achieve" then
        highlight_group = "AchieveMsg"
    elseif level == "error" then
        highlight_group = "ErrorMsg"
    end
    local cmd = ":echohl " .. highlight_group .. " | echon \"" .. msg .. "\""
    vim.cmd(cmd)

    local timer = vim.loop.new_timer()
    timer:start(1000, 0, vim.schedule_wrap(function()
        vim.cmd([[:echo ""]])
        timer:close()
        timer = nil
    end))
end

vim.keymap.set("n", "<leader><leader>r", function()
   local current_file = vim.fn.expand('%:h', "", "")
    if vim.bo.filetype == 'vim' then
        vim.cmd([[:silent! write]])
        vim.cmd([[:source %]])
        vim.notify(" " .. current_file .. " reloaded !", "achieve")
    elseif vim.bo.filetype == 'lua' then
        vim.cmd([[:silent! write]])
        vim.cmd([[:luafile %]])
        vim.notify(" " .. current_file .. " reloaded !", "achieve")
    else
        vim.notify("" .. current_file .. " could not be loaded !", "error")
    end
end)
