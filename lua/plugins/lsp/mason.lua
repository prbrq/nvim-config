return {
    -- Mason — установщик LSP серверов
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                ui = {
                    border = "rounded",
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })
        end,
    },

    -- Мост между Mason и nvim-lspconfig
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("mason-lspconfig").setup({
                -- Автоматически установить эти серверы
                ensure_installed = {
                    "lua_ls",      -- Lua (для конфигурации NeoVim)
                    "omnisharp",   -- C# (мы настроим позже)
                },
                -- Автоматически настраивать установленные серверы
                automatic_installation = true,
            })
        end,
    },

    -- nvim-lspconfig — конфигурации серверов
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- Базовая настройка LSP клиента

            -- Диагностика
            vim.diagnostic.config({
                virtual_text = true,
                signs = true,
                update_in_insert = false,
                underline = true,
                severity_sort = true,
                float = {
                    border = "rounded",
                    source = "always",
                },
            })

            -- Иконки для диагностики
            local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end
        end,
    },
}

