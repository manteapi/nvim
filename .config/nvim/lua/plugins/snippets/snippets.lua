local luasnip = require("luasnip")

local s = luasnip.s
local i = luasnip.insert_node
local t = luasnip.text_node
local c = luasnip.choice_node
local sn = luasnip.sn
local d = luasnip.dynamic_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

-- NOTE: See TakeTuesday for more tips
-- https://www.youtube.com/watch?v=KtQZRAkgLqo

luasnip.add_snippets("all",
{
    s("mail", fmt("pierre-luc.manteaux@circle.dental", {})),
}
)

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

function todo_snippet(filetype)
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

function function_definition()
    return s("def",
    fmt(
    [[
    def {}({}) -> {}:
        """ TODO: explain """
        {}
    ]]
    , {
        i(1, "name"),
        c(2, {t"", t"parameter: type"}),
        i(3, "None"),
        i(0, "pass"),
    })
    )
end

function list_comprehension()
    return s("[l",
    fmt(
    [[
    [{} for {} in {}]
    ]]
    , {
        i(1, "value"),
        i(2, "value"),
        i(0, "list"),
    })
    )
end

luasnip.add_snippets("js",
{
    todo_snippet("js")
}
)

luasnip.add_snippets("qml",
{
    todo_snippet("qml")
}
)

luasnip.add_snippets("lua",
{
    todo_snippet("lua")
}
)

luasnip.add_snippets("python",
{
    todo_snippet("python"),
    function_definition(),
    list_comprehension()
}
)
