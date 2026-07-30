return {
    cmd = { "qmlls" },
    filetypes = { "qml" },

    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end,
}
