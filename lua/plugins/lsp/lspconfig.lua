return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        local lspconfig = require("lspconfig")

        -- Функция, вызываемая при подключении LSP к буферу
        local on_attach = function(client, bufnr)
            -- Опции для keymaps (только в этом буфере)
            local opts = { buffer = bufnr, silent = true }

            -- Навигация по коду
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, 
                vim.tbl_extend("force", opts, { desc = "Go to definition" }))
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, 
                vim.tbl_extend("force", opts, { desc = "Go to declaration" }))
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, 
                vim.tbl_extend("force", opts, { desc = "Go to implementation" }))
            vim.keymap.set("n", "gr", vim.lsp.buf.references, 
                vim.tbl_extend("force", opts, { desc = "Find references" }))

            -- Информация о коде
            vim.keymap.set("n", "K", vim.lsp.buf.hover, 
                vim.tbl_extend("force", opts, { desc = "Show hover" }))
            vim.keymap.set("n", "<leader>k", vim.lsp.buf.signature_help, 
                vim.tbl_extend("force", opts, { desc = "Signature help" }))

            -- Рефакторинг
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, 
                vim.tbl_extend("force", opts, { desc = "Rename symbol" }))
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, 
                vim.tbl_extend("force", opts, { desc = "Code actions" }))

            -- Диагностика
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, 
                vim.tbl_extend("force", opts, { desc = "Previous diagnostic" }))
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next, 
                vim.tbl_extend("force", opts, { desc = "Next diagnostic" }))
            vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, 
                vim.tbl_extend("force", opts, { desc = "Show diagnostic" }))
        end

        -- Общие capabilities для всех серверов
        local capabilities = vim.lsp.protocol.make_client_capabilities()

        -- Настройка lua_ls для конфигурации NeoVim
        lspconfig.lua_ls.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },  -- не ругаться на глобальную переменную vim
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                        checkThirdParty = false,
                    },
                    telemetry = { enable = false },
                },
            },
        })
    end,
}

