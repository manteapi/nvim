require("neorg").setup({
	load = {
		["core.defaults"] = {},
		["core.norg.qol.toc"] = {},
		["core.gtd.base"] = {
            config = {
                workspace = "work"
            }
        },
		["core.norg.journal"] = {
			config = {
				workspaces = "home",
			},
		},
		["core.norg.completion"] = {
			config = {
				engine = "nvim-cmp",
			},
		},
		["core.norg.concealer"] = {},
		["core.norg.dirman"] = {
			config = {
				workspaces = {
					work = "~/repositories/neo-notes/work",
					home = "~/repositories/neo-notes/home",
				},
			},
		},
	},
})
