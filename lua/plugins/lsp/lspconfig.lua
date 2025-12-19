
return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",  -- добавляем зависимость
    },
    config = function()
        local lspconfig = require("lspconfig")

        local on_attach = function(client, bufnr)
            local opts = { buffer = bufnr, silent = true }

            -- Навигация
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, 
            vim.tbl_extend("force", opts, { desc = "Go to definition" }))
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, 
            vim.tbl_extend("force", opts, { desc = "Go to declaration" }))
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, 
            vim.tbl_extend("force", opts, { desc = "Go to implementation" }))
            vim.keymap.set("n", "gr", vim.lsp.buf.references, 
            vim.tbl_extend("force", opts, { desc = "Find references" }))
            vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, 
            vim.tbl_extend("force", opts, { desc = "Go to type definition" }))

            -- Информация
            vim.keymap.set("n", "K", vim.lsp.buf.hover, 
            vim.tbl_extend("force", opts, { desc = "Show hover" }))
            vim.keymap.set("n", "<leader>k", vim.lsp.buf.signature_help, 
            vim.tbl_extend("force", opts, { desc = "Signature help" }))

            -- Рефакторинг
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, 
            vim.tbl_extend("force", opts, { desc = "Rename symbol" }))
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, 
            vim.tbl_extend("force", opts, { desc = "Code actions" }))

            -- Форматирование
            vim.keymap.set("n", "<leader>f", function()
                vim.lsp.buf.format({ async = true })
            end, vim.tbl_extend("force", opts, { desc = "Format code" }))

            -- Диагностика
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, 
            vim.tbl_extend("force", opts, { desc = "Previous diagnostic" }))
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next, 
            vim.tbl_extend("force", opts, { desc = "Next diagnostic" }))
            vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, 
            vim.tbl_extend("force", opts, { desc = "Show diagnostic" }))
            vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, 
            vim.tbl_extend("force", opts, { desc = "Diagnostic quickfix" }))
        end

        -- КРИТИЧЕСКИ ВАЖНО: capabilities из nvim-cmp
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- Настройка lua_ls
        lspconfig.lua_ls.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim" } },
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

