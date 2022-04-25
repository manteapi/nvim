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
    print("caca")
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
