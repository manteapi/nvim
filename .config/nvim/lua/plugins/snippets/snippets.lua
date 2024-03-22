local luasnip = require("luasnip")

local s = luasnip.s
local i = luasnip.insert_node
local t = luasnip.text_node
local c = luasnip.choice_node
local sn = luasnip.sn
local d = luasnip.dynamic_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local common = require("plugins.snippets.common_snippets")

-- NOTE: See TakeTuesday for more tips
-- https://www.youtube.com/watch?v=KtQZRAkgLqo

luasnip.add_snippets("all",
{
    s("mail", fmt("pierre-luc.manteaux@circle.dental", {})),
}
)

require("plugins.snippets.lua_snippets")
require("plugins.snippets.python_snippets")
require("plugins.snippets.qml_snippets")
