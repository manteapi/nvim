require('telescope').setup {
    pickers = {
        find_files = {
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
vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>fr", "<cmd>lua require('telescope').extensions.live_grep_raw.live_grep_raw()<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>fp", "<cmd>lua require('telescope.builtin').git_files()<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>fs", "<cmd>lua require('telescope.builtin').grep_string()<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
