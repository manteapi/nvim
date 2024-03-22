local luasnip = require("luasnip")
local common = require("plugins.snippets.common_snippets")

luasnip.add_snippets("qml",
{
    common.todo_snippet("qml")
}
)
