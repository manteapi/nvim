local hop = require('hop')

hop.setup({ keys = 'etovxqpdygfblzhckisuran' })

local directions = require('hop.hint').HintDirection

vim.keymap.set('', '<leader>w', function()
    hop.hint_words()
end, { desc = 'Hop to word' })

vim.keymap.set('', '<leader>c', function()
    hop.hint_char1()
end, { desc = 'Hop to 1 character' })

vim.keymap.set('', '<leader>l', function()
    hop.hint_lines()
end, { desc = 'Hop to line' })

vim.keymap.set('', 'f', function()
    hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, { desc = 'Hop forward to char on current line' })

vim.keymap.set('', 'F', function()
    hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, { desc = 'Hop backward to char on current line' })

vim.keymap.set('', 't', function()
    hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, { desc = 'Hop forward just before char on current line' })

vim.keymap.set('', 'T', function()
    hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, { desc = 'Hop backward just before char on current line' })
