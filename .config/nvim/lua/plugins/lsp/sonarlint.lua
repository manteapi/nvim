require('sonarlint').setup({
   server = {
      cmd = {
         'sonarlint-language-server',
         '-stdio',
         '-analyzers',
         vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarpython.jar"),
         vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarcfamily.jar"),
      }
   },
   filetypes = {
      'python',
      'cpp',
   }
})
