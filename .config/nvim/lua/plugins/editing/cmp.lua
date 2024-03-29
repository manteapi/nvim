local cmp = require("cmp")

cmp.setup({
    mapping = {
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<C-k>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        }),
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "nvim_lsp_signature_help" },
        { name = "luasnip" },
        { name = "neorg" },
        { name = "buffer",
          option = {
            get_bufnrs = function()
            return vim.api.nvim_list_bufs()
            end
          }
        },
        { name = "path" },
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({"/", "?"}, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        {
            name = "buffer",
            keyword_length = 5
        },
    },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':',
{
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources(
    {{ name = 'path' }},
    {{ name = 'cmdline' }}
    )
})
