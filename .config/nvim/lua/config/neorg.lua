require("neorg").setup({
	load = {
		["core.defaults"] = {},
		["core.dirman"] = {
			config = {
				workspaces = {
					work = "~/repositories/dotfiles/neo-notes/work",
					home = "~/repositories/dotfiles/neo-notes/home",
				},
			},
		},
		["core.concealer"] = {},
		["core.completion"] = {
			config = {
				engine = "nvim-cmp",
			},
		},
		["core.journal"] = {
			config = {
				workspace = "work",
				strategy = "flat",
                journal_folder = "journal"
			},
		},
	},
})
