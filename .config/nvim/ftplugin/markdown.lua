vim.opt.foldlevel=99
vim.opt.foldmethod="expr"
vim.wo.foldmethod="expr"
vim.wo.foldexpr="nvim_treesitter#foldexpr()"
vim.wo.foldenable=false

local function handle_quotes(input)
    return string.gsub(input, "'", "\\\\'")
end

vim.api.nvim_command('set makeprg=pandoc\\ '..handle_quotes(vim.fn.expand('%', '', ''))..'\\ --from\\ markdown+emoji\\ --to\\ revealjs\\ --slide-level\\ 2\\ --filter\\ pandoc-plantuml\\ --standalone\\ --output\\ index.html\\ --variable\\ revealjs-url=https://unpkg.com/reveal.js@3.9.0/\\ --variable\\ slideNumber=true\\ --variable\\ theme=solarized\\ --variable\\ width=1920\\ --variable\\ height=1080')
