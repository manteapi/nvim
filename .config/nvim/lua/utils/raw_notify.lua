local M = {}

function M.notify(msg, level)
    local highlight_group = "AchieveMsg"
    if level == "achieve" then
        highlight_group = "AchieveMsg"
    elseif level == "error" then
        highlight_group = "ErrorMsg"
    end
    local cmd = ":echohl " .. highlight_group .. " | echon \"" .. msg .. "\" | echohl None"
    vim.cmd(cmd)

    local timer = vim.loop.new_timer()
    timer:start(1000, 0, vim.schedule_wrap(function()
        vim.cmd([[:echo ""]])
        timer:close()
        timer = nil
    end))
end

return M
