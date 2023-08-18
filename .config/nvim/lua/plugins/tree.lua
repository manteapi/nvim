require('nvim-tree').setup({})

local opts = {noremap=true, silent=true}
vim.keymap.set("n", "<Leader>e", 
function() 
  local api = require "nvim-tree.api"
  if api.tree.is_tree_buf() then
      api.tree.close()
  else
      api.tree.focus()
  end
end,opts)
