flash = require("flash")

flash.setup({
    modes = {
        search = {
            enabled = false
        }
    }
})

-- vim.keymap.set({"n", "x", "o"}, "s", function()
    --     flash.jump()
    -- end, bufopts)
