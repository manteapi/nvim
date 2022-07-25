require('gitsigns').setup{
    signs = {
        add          = {hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
        change       = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
        delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        changedelete = {hl = 'GitSignsChange', text = '-', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    },
    current_line_blame = true,
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local opts = {noremap=true, silent=true, buffer=bufnr}
        vim.keymap.set("n", "<leader>tb",gs.toggle_current_line_blame, opts)
    end
}

vim.cmd([[highlight SignColumn ctermbg=black]])
vim.cmd([[highlight GitSignsChange cterm=bold ctermbg=black ctermfg=blue]])
vim.cmd([[highlight GitSignsAdd cterm=bold ctermbg=black ctermfg=green]])
vim.cmd([[highlight GitSignsDelete cterm=bold ctermbg=black ctermfg=red]])
