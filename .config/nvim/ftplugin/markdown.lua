local function handle_quotes(input)
    return string.gsub(input, "'", "\\\\'")
end

vim.api.nvim_command('set makeprg=pandoc\\ '..handle_quotes(vim.fn.expand('%', '', ''))..'\\ --from\\ markdown+emoji\\ --to\\ revealjs\\ --slide-level\\ 3\\ --filter\\ pandoc-plantuml\\ --standalone\\ --output\\ index.html\\ --table-of-content\\ --variable\\ revealjs-url=https://unpkg.com/reveal.js@latest/\\ --variable\\ slideNumber=true\\ --variable\\ theme=solarized')
