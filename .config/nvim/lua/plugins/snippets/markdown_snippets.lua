local luasnip = require("luasnip")
local s = luasnip.s
local fmt = require("luasnip.extras.fmt").fmt

luasnip.add_snippets("markdown",
    {
        s("todo", fmt("- [-]", {})),
    }
)
