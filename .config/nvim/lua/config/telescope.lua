local current_selection = require("utils.helpers").current_selection
local current_word = require("utils.helpers").current_word

local lga_actions = require("telescope-live-grep-args.actions")

require("telescope").setup({
	pickers = {
		find_files = {
			theme = "dropdown",
			hidden = true,
			follow = true,
			no_ignore = true,
			no_ignore_parent = true,
		},
	},
	defaults = {
		path_display = {
			shorten = 4,
		},
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
		},
		file_ignore_patterns = {
			"%.stl",
			"%.webm",
			"%.mhd",
			"%.idx",
			"%.gz",
			"%.zip",
			"%.jpg",
			"%.json.hash",
			"%.bmp",
			"%.raw",
			"%.png",
			"%.obj",
			"%.iges",
			"%.o",
			".mypy_cache/*",
			".venv/*",
			"%-data*",
			"%-model*",
			"build*",
			".cache/.*",
			".git/.*",
		},
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
		live_grep_args = {
			auto_quoting = true,
			mappings = {
				i = {
					["<C-t>"] = lga_actions.quote_prompt({ postfix = " -t" }),
				},
			},
		},
	},
})
require("telescope").load_extension("fzf")
require("telescope").load_extension("frecency")
require("telescope").load_extension("repo")
require("telescope").load_extension("file_browser")

local opts = { noremap = true }

vim.keymap.set("n", "<leader>st", function()
	local current_file = vim.fn.expand("%:p:h", "", "")
	local command = "TodoTelescope cwd=" .. current_file
	vim.api.nvim_command(command)
end, opts)

vim.keymap.set("n", "<leader>sf", function()
	require("telescope.builtin").find_files({})
end, opts)

vim.keymap.set("n", "<leader>sF", require("telescope").extensions.repo.list, opts)

vim.keymap.set("n", "<leader>se", function()
	require("telescope").extensions.file_browser.file_browser({
		path = vim.fn.expand("%:p:h", "", ""),
	})
end, opts)

vim.keymap.set("n", "<leader>sfc", function()
	require("telescope.builtin").find_files({
		cwd = "~/repositories/lucy-deployment/sofa-submodules/circle/",
	})
end, opts)

vim.keymap.set("n", "<leader>sfn", function()
	require("telescope.builtin").find_files({
		cwd = "~/repositories/dotfiles/neo-notes/",
	})
end, opts)

vim.keymap.set("n", "<leader>sSC", function()
	require("telescope").extensions.live_grep_args.live_grep_args({
		previewer = false,
		cwd = "~/repositories/lucy-deployment/sofa-submodules/circle/",
		default_text = "",
	})
end, opts)

vim.keymap.set("v", "<leader>sSC", function()
	require("telescope").extensions.live_grep_args.live_grep_args({
		previewer = false,
		cwd = "~/repositories/lucy-deployment/sofa-submodules/circle/",
		default_text = current_selection(),
	})
end, opts)

-- require("telescope.builtin").live_grep({grep_open_files = true,})
-- require("telescope.builtin").grep_string({})
-- require("telescope.builtin").live_grep({})

vim.keymap.set("v", "<leader>ss", function()
	require("telescope.builtin").current_buffer_fuzzy_find({
		default_text = current_selection(),
	})
end, opts)

vim.keymap.set("n", "<leader>ss", function()
	require("telescope.builtin").current_buffer_fuzzy_find({
		default_text = "",
	})
end, opts)

vim.keymap.set("n", "<leader>sS", function()
	require("telescope").extensions.live_grep_args.live_grep_args({
		previewer = false,
		default_text = "",
	})
end, opts)

vim.keymap.set("v", "<leader>sS", function()
	require("telescope").extensions.live_grep_args.live_grep_args({
		previewer = false,
		default_text = current_selection(),
	})
end, opts)

vim.keymap.set("n", "<leader>sb", require("telescope.builtin").buffers, opts)
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, opts)
vim.keymap.set("n", "<leader>sgf", require("telescope.builtin").git_files, opts)
vim.keymap.set("n", "<leader>sgc", require("telescope.builtin").git_commits, opts)
vim.keymap.set("n", "<leader>sgb", require("telescope.builtin").git_branches, opts)
