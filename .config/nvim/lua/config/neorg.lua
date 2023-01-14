require("neorg").setup({
	load = {
		["core.defaults"] = {},
		["core.export"] = {},
		["core.export.markdown"] = {},
		["core.keybinds"] = {},
		["core.norg.qol.toc"] = {},
		-- ["core.gtd.base"] = {
		-- 	config = {
		-- 		workspace = "work",
        --               exclude = {"journal", "presentations", "tasks/trash"}
		-- 	},
		-- },
		-- ["core.gtd.ui"] = {},
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
