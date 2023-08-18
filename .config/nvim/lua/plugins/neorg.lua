require("neorg").setup({
    load = {
        ["core.defaults"] = {},
        ["core.dirman"] = {
            config = {
                workspaces = {
                    work = "~/repositories/dotfiles/neo-notes/work",
                    home = "~/repositories/dotfiles/neo-notes/home",
                },
                default_workspace = "work",
            },
        },
        ["core.concealer"] = {},
        -- ["core.completion"] = {
        --     config = {
        --         engine = "nvim-cmp",
        --     },
        -- },
        ["core.journal"] = {
            config = {
                workspace = "work",
                strategy = "flat",
                journal_folder = "journal"
            },
        },
        ["core.pivot"] = {},
        ["core.itero"] = {},
        ["core.promo"] = {},
        ["core.esupports.metagen"] = { config = { update_date = true } },
        ["core.qol.toc"] = { config = { close_after_use = true } },
        ["core.summary"] = {},
        ["core.export"] = {}
    },
})

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.norg"},
  command = "set conceallevel=3"
})
