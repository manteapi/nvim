require("neotest").setup({
   adapters = {
    require("neotest-vim-test")({
      ignore_file_types = { "python", "vim", "lua" },
    }),
   },
})

vim.api.nvim_create_user_command('RunTest',
    function()
        print("[NeoTest] FIXME: Write a custom adapter")
        require("neotest").run.run()
    end,
    {nargs=0}
)
