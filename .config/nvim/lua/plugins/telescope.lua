local telescope = require('telescope')

telescope.setup{
    defaults = {
        path_display={
            truncate=3
        },
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
}

function split(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        table.insert(t, str)
    end
    return t
end

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
    builtin.grep_string({
        search = vim.fn.input("Grep > "),
    })
end, opts)

vim.keymap.set("n", "<Leader>tl", function()
    builtin.live_grep({
        glob_pattern = vim.fn.input("Pattern > ", "*.py")
    })
end, opts)

vim.keymap.set("n", "<Leader>tf", function()
    raw_args = vim.fn.input("Fd > ")
    args = {"fd", "--hidden", "--type", "file"}
    split_args = split(raw_args)
    for k,v in pairs(split_args) do
        table.insert(args, v)
        print(k,v)
    end
    builtin.find_files({
        find_command = args
    })
end, opts)

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
