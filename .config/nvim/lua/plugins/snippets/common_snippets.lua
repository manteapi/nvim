local M = {}

local luasnip = require("luasnip")
local s = luasnip.s
local i = luasnip.insert_node
local t = luasnip.text_node
local c = luasnip.choice_node
local fmt = require("luasnip.extras.fmt").fmt

function comment_tag(filetype)
    if filetype == "qml" then
        return "//"
    elseif filetype == "lua" then
        return "--"
    elseif filetype == "python" then
        return "#"
    else
        return "//"
    end
end

function M.todo_snippet(filetype)
    return s(
    "todo",
    fmt(
    comment_tag(filetype) .. " {}: {}",
    {
        c(1, {t "TODO", t "FIX", t "HACK", t "PERF", t "WARNING", t "NOTE"} ),
        i(0, "this is a comment")
    }
    )
    )
end

return M
