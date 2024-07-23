require('gitsigns').setup()

local gitsigns = require('gitsigns')

vim.keymap.set("n", "]c", function()
    if vim.wo.diff then return "]c" end
    vim.schedule(function() gitsigns.next_hunk() end)
    return '<Ignore>'
end, {expr= true, desc="Move to next hunk"})

vim.keymap.set("n", "[c", function()
    if vim.wo.diff then return "[c" end
    vim.schedule(function() gitsigns.prev_hunk() end)
    return '<Ignore>'
end, {expr= true, desc="Move to previous hunk"})

vim.keymap.set({"n", "v"}, "<leader>hs", ':Gitsigns stage_hunk<CR>', {noremap = true, desc="Stage hunk"})
vim.keymap.set("n", "<leader>hu", ':Gitsigns undo_stage_hunk<CR>', {noremap = true, desc="Undo stage hunk"})
vim.keymap.set("n", "<leader>hS", ':Gitsigns stage_buffer<CR>', {noremap = true, desc="Stage buffer"})

vim.keymap.set({"n", "v"}, "<leader>hr", ':Gitsigns reset_hunk<CR>', {noremap = true, desc="Reset hunk"})
vim.keymap.set("n", "<leader>hR", ':Gitsigns reset_buffer<CR>', {noremap = true, desc="Reset buffer"})

vim.keymap.set("n", "<leader>hp", ':Gitsigns preview_hunk<CR>', {noremap = true, desc="Preview hunk"})

vim.keymap.set('n', '<leader>hb', function() gitsigns.blame_line{full=true} end, {noremap = true, desc="Blame line"})
vim.keymap.set("n", "<leader>tB", ':Gitsigns toggle_current_line_blame<CR>', {noremap = true, desc="Toggle current line blame"})

vim.keymap.set('n', '<leader>hd', gitsigns.diffthis, {noremap = true, desc = "Diff this"})
vim.keymap.set('n', '<leader>hD', function() gitsigns.diffthis('~') end, {noremap = true, desc = "Diff this"})
