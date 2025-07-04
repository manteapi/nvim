
local hop = require('hop')

hop.setup({ keys = 'etovxqpdygfblzhckisuran' })

local directions = require('hop.hint').HintDirection
-- vim.keymap.set('', 'z', function()
--   hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
-- end, {remap=true, silent=true})
-- vim.keymap.set('', 'Z', function()
--   hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
-- end, {remap=true, silent=true})
vim.keymap.set('', 'mf', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
end, {remap=true, silent=true})
vim.keymap.set('', 'mF', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
end, {remap=true, silent=true})
vim.keymap.set('', 'mt', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false, hint_offset = -1 })
end, {remap=true, silent=true})
vim.keymap.set('', 'mT', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false, hint_offset = 1 })
end, {remap=true, silent=true})
