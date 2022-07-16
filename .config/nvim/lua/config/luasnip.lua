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
local c = luasnip.choice_node

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
        todo_snippet("python")
    }
)
