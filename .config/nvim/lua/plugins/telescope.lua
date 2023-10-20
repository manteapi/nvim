local telescope = require('telescope')

telescope.load_extension("live_grep_args")

local lga_actions = require("telescope-live-grep-args.actions")

telescope.setup{
    defaults = {
        path_display={
            truncate=3
        }
    },
    pickers = {
        buffers = {
            show_all_buffers = true,
            mappings = {
                i = {
                    ["<c-d>"] = "delete_buffer",
                }
            }
        }
    },
    extensions = {
        live_grep_args = {
            auto_quoting = true,
            mappings = {
                i = {
					["<c-t>"] = lga_actions.quote_prompt({ postfix = " -t" }),
                },
            },
        }
    }
}

local current_selection = function()
   local register = vim.fn.getreg("\"")
   vim.api.nvim_exec("normal! y", false)
   local filter = vim.fn.trim(vim.fn.getreg("@"))
   vim.fn.setreg("\"", register)
   return filter
end

builtin = require('telescope.builtin')

local opts = { noremap = true }

vim.keymap.set("n", "<Leader>tb", builtin.buffers, opts)
vim.keymap.set("n", "<Leader>tg", function()
    builtin.grep_string({search = vim.fn.input("Grep > ")})
end, opts)
vim.keymap.set("n", "<Leader>tl", function()
    telescope.extensions.live_grep_args.live_grep_args({
        default_text = current_selection(),
    })
end, opts)
vim.keymap.set("n", "<Leader>tf", builtin.find_files, opts)
vim.keymap.set("n", "<Leader>th", builtin.help_tags, opts)
vim.keymap.set("n", "<Leader>tk", builtin.keymaps, opts)
vim.keymap.set("n", "<Leader>ts", builtin.lsp_document_symbols, opts)
vim.keymap.set("n", "<Leader>tr", builtin.lsp_references, opts)
vim.keymap.set("n", "<Leader>tw", builtin.lsp_dynamic_workspace_symbols, opts)
vim.keymap.set("n", "<Leader>tm", builtin.marks, opts)

vim.keymap.set("n", "<Leader>tc", function()
    builtin.find_files({
        cwd = "~/repositories/dotfiles/nvim/",
    })
end, opts)

vim.keymap.set("n", "<Leader>tn", function()
    builtin.find_files({
        cwd = "~/repositories/dotfiles/neo-notes/",
    })
end, opts)
