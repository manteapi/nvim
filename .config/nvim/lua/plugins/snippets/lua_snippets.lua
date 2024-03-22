local luasnip = require("luasnip")
local common = require("plugins.snippets.common_snippets")

luasnip.add_snippets("lua",
{
    common.todo_snippet("lua")
}
)
