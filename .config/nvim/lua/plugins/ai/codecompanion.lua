require("codecompanion").setup({
    log_level = "DEBUG",
    disable_default_adapters = true, -- disable other adapters

    adapters = {
        -- config the `ollama` HTTP adapter
        ollama = function()
            return require("codecompanion.adapters").extend("openai_compatible", {
                env = {
                    url = "http://localhost:11434", -- Ollama locally
                },
            })
        end,
    },

    interactions = {
        chat   = { adapter = "ollama" },
        inline = { adapter = "ollama" },
    },
})
