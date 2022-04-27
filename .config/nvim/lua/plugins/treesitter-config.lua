require'nvim-treesitter.configs'.setup {
  ensure_installed = {"lua", "rust", "python", "json", "javascript"},
  sync_install = false,
  highlight = {
    enable = false
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gni",
      node_incremental = "gnn",
      scope_incremental = "gns",
      node_decremental = "gnm",
    },
    },
  indent = {
    enable = true
  }
}

vim.opt.foldmethod="expr"
vim.wo.foldmethod="expr"
vim.wo.foldexpr="nvim_treesitter#foldexpr()"
vim.wo.foldenable=false
