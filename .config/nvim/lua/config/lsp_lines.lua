local lsp_lines = require("lsp_lines")
local current_virtual_text = true
local current_virtual_lines = false

lsp_lines.setup()

-- Disable virtual_text since it's redundant due to lsp_lines.
vim.diagnostic.config({
    virtual_text = current_virtual_text,
    virtual_lines = current_virtual_lines
})

local opts = {noremap=true, silent=true}
vim.keymap.set("n", "<Leader>l", function()
    current_virtual_lines = not current_virtual_lines
    current_virtual_text = not current_virtual_text
    vim.diagnostic.config({
        virtual_text = current_virtual_text,
        -- FIXME: Error executing vim.schedule lua callback: ...ack/packer/start/lsp_lines.nvim/lua/lsp_lines/render.lua:200: Invalid buffer id: 41
        --virtual_lines = current_virtual_lines
        virtual_lines = false
    })
end, opts)
