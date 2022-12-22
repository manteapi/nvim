require'nvim-treesitter.configs'.setup {
  ensure_installed = {"norg", "lua", "rust", "python", "json", "javascript", "qmljs"},
  sync_install = false,
  highlight = {
    enable = true
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
