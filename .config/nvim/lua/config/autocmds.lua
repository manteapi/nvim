-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = "*",
})


local recording_group = vim.api.nvim_create_augroup("RecordingCmdHeight", {clear=true})

vim.api.nvim_create_autocmd("RecordingEnter", {
    callback = function()
        vim.cmd([[set cmdheight=1]])
    end, group=recording_group, pattern="*",
})

vim.api.nvim_create_autocmd("RecordingLeave", {
    callback = function()
        vim.cmd([[set cmdheight=0]])
    end, group=recording_group, pattern="*",
})
