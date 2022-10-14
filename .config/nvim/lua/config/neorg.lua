require("neorg").setup({
	load = {
		["core.defaults"] = {},
		["core.keybinds"] = {},
		["core.norg.qol.toc"] = {},
		["core.gtd.base"] = {
			config = {
				workspace = "work",
			},
		},
		["core.presenter"] = {
			config = {
				zen_mode = "zen-mode",
			},
		},
		["core.norg.journal"] = {
			config = {
				workspaces = "home",
				strategy = "flat",
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
					work = "~/repositories/dotfiles/neo-notes/work",
					home = "~/repositories/dotfiles/neo-notes/home",
				},
			},
		},
	},
})
