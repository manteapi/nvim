local luasnip = require "luasnip"

luasnip.config.set_config {
    -- Remember the last snippet and allow to jump back into it
    -- even if we moved outside of the selection
    history = true,

    -- Allow to updates dynamic snippets as we type
    updateevents = "TextChanged,TextChangedI",

    enable_autosnippets = true,
}

vim.keymap.set({"i", "s"}, "<c-k>", function()
    if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
    end
end, {silent=true})

vim.keymap.set({"i", "s"}, "<c-j>", function()
    if luasnip.jumpable(-1) then
        luasnip.jump(-1)
    end
end, {silent=true})

vim.keymap.set("i", "<c-l>", function()
    if luasnip.choice_active() then
        luasnip.change_choice(1)
    end
end, {silent=true})

local s = luasnip.s
local i = luasnip.insert_node
local t = luasnip.text_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

luasnip.add_snippets("all",
    {
        luasnip.snippet({trig="expand"}, {t("-- this is what is expanded !")}),
        luasnip.parser.parse_snippet("expand2", "-- this is what is expanded !"),
        s("expand3", fmt("local {} = require('{}')", {i(1, "default"), rep(1)}))
    }
)
