local luasnip = require("luasnip")

local common = require("plugins.snippets.common_snippets")

local s = luasnip.s
local i = luasnip.insert_node
local t = luasnip.text_node
local c = luasnip.choice_node
-- local sn = luasnip.sn
-- local d = luasnip.dynamic_node

local fmt = require("luasnip.extras.fmt").fmt

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

luasnip.add_snippets("python",
{
    common.todo_snippet("python"),
    function_definition(),
    list_comprehension()
}
)
