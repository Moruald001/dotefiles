return {
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },

        -- Raccourci clavier intégré
        keys = {
            {
                "<leader>fm",
                function()
                    require("conform").format({ async = true, lsp_fallback = true })
                end,
                mode = "",
                desc = "Format code",
            },
        },

        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    javascript = { "prettier" },
                    typescript = { "prettier" },
                    javascriptreact = { "prettier" },
                    typescriptreact = { "prettier" },
                    dart = { "dart_format" },
                    lua = { "stylua" },

                    -- Formatage pour les fichiers QML
                    qml = { "qmlfmt" },
                },

                format_on_save = {
                    timeout_ms = 500,
                    lsp_fallback = true,
                },
            })
        end,
    },
}
