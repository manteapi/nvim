require('telescope').setup {
    pickers = {
        find_files = {
            theme = "dropdown",
            hidden = true
        },
    },
    defaults = {
        path_display = {
            shorten = 1
        },
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden"
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
        }
    },
	extensions = {
		fzf = {
			fuzzy = true,                    -- false will only do exact matching
			override_generic_sorter = true,  -- override the generic sorter
			override_file_sorter = true,     -- override the file sorter
			case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		}
	}
}
require('telescope').load_extension('fzf')

local opts = { noremap = true }
vim.keymap.set("n", "<leader>sn", "<cmd>TodoTelescope<cr>", opts)
vim.keymap.set("n", "<leader>sf", require('telescope.builtin').find_files, opts)
vim.keymap.set("n", "<leader>ss", require('telescope.builtin').current_buffer_fuzzy_find, opts)
vim.keymap.set("n", "<leader>sgs", require('telescope.builtin').grep_string, opts)
vim.keymap.set("n", "<leader>sS", require('telescope.builtin').live_grep, opts)
vim.keymap.set("n", "<leader>srS", require('telescope').extensions.live_grep_raw.live_grep_raw, opts)
vim.keymap.set("n", "<leader>sb", require('telescope.builtin').buffers, opts)
vim.keymap.set("n", "<leader>sh", require('telescope.builtin').help_tags, opts)
vim.keymap.set("n", "<leader>sgf", require('telescope.builtin').git_files, opts)
vim.keymap.set("n", "<leader>sgc", require('telescope.builtin').git_commits, opts)
vim.keymap.set("n", "<leader>sgb", require('telescope.builtin').git_branches, opts)
