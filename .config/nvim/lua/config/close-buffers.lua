require('close_buffers').setup({
  filetype_ignore = {},  -- Filetype to ignore when running deletions
  file_glob_ignore = {},  -- File name glob pattern to ignore when running deletions (e.g. '*.md')
  file_regex_ignore = {}, -- File name regex pattern to ignore when running deletions (e.g. '.*[.]md')
  preserve_window_layout = { 'this', 'nameless' },  -- Types of deletion that should preserve the window layout
  next_buffer_cmd = nil,  -- Custom function to retrieve the next buffer when preserving window layout
})

local opts = { noremap = true, silent = true}
vim.keymap.set('n', 'bdo',
    function()
        require('close_buffers').delete({ type = 'other' })
    end,
opts)

vim.keymap.set('n', 'bda',
    function()
        require('close_buffers').delete({ type = 'all' })
    end,
opts)

vim.keymap.set('n', 'bdc',
    function()
        require('close_buffers').delete({ type = 'this' })
    end,
opts)

vim.keymap.set('n', 'bdh',
    function()
        require('close_buffers').delete({ type = 'hidden', force = true })
    end,
opts)
