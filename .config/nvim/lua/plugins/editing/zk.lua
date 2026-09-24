vim.env.ZK_NOTEBOOK_DIR = vim.fn.expand("~/notes")

require('zk').setup({
    picker = "telescope",
    lsp = {
        config = {
            name = "zk",
            cmd = { "zk", "lsp" },
            filetypes = { "markdown" },
        },
        -- automatically attach buffers in a zk notebook that match the given filetypes
        auto_attach = {
            enabled = true,
        },
    },
    tags = {
        -- Configure how multiple tags should be combined in a ZkTags search
        -- Can be "AND" or "OR"
        multi_select_strategy = "AND",
    }
})

local zk_commands = require("zk.commands")
vim.keymap.set("n", "<leader>tn", function()
    zk_commands.get("ZkNotes")()
end, { silent = true, noremap = true, desc = "List notes" })

local zk = require("zk")
vim.keymap.set("n", "<leader>zn", function()
    zk.new({ dir = "notes", group = "notes", title = vim.fn.input("Title: ") })
end, { desc = "Create new note" })

vim.keymap.set("n", "<leader>zj", function()
    zk.new({ dir = "journal", group = "journal" })
end, { desc = "Create new journal entry" })
