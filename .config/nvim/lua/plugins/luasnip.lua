local luasnip = require "luasnip"

luasnip.config.set_config {
    -- Remember the last snippet and allow to jump back into it
    -- even if we moved outside of the selection
    history = true,

    -- Allow to updates dynamic snippets as we type
    updateevents = "TextChanged,TextChangedI"

    enable_autosnippets = true,
}
