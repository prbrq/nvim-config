
return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        -- Источники для автодополнения
        "hrsh7th/cmp-nvim-lsp",     -- LSP источник (критически важно!)
        "hrsh7th/cmp-buffer",        -- текст из буферов
        "hrsh7th/cmp-path",          -- пути файловой системы
        "hrsh7th/cmp-cmdline",       -- командная строка Vim

        -- Snippets движок (требуется для LSP)
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",

        -- Иконки в меню автодополнения
        "onsails/lspkind.nvim",
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local lspkind = require("lspkind")

        cmp.setup({
            -- Движок сниппетов
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },

            -- Внешний вид окна автодополнения
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },

            -- Клавиатурные привязки
            mapping = cmp.mapping.preset.insert({
                -- Навигация по списку
                ["<C-n>"] = cmp.mapping.select_next_item(),
                ["<C-p>"] = cmp.mapping.select_prev_item(),

                -- Прокрутка документации
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),

                -- Вызов автодополнения вручную
                ["<C-Space>"] = cmp.mapping.complete(),

                -- Отмена
                ["<C-e>"] = cmp.mapping.abort(),

                -- Подтверждение выбора
                ["<CR>"] = cmp.mapping.confirm({ select = false }),

                -- Tab для навигации по сниппетам
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),

            -- Источники автодополнения (в порядке приоритета)
            sources = cmp.config.sources({
                { name = "nvim_lsp", priority = 1000 },  -- LSP — высший приоритет
                { name = "luasnip", priority = 750 },
                { name = "buffer", priority = 500 },
                { name = "path", priority = 250 },
            }),

            -- Форматирование элементов списка
            formatting = {
                format = lspkind.cmp_format({
                    mode = "symbol_text",
                    maxwidth = 50,
                    ellipsis_char = "...",

                    -- Показываем, откуда пришло предложение
                    before = function(entry, vim_item)
                        vim_item.menu = ({
                            nvim_lsp = "[LSP]",
                            luasnip = "[Snippet]",
                            buffer = "[Buffer]",
                            path = "[Path]",
                        })[entry.source.name]
                        return vim_item
                    end,
                }),
            },
        })

        -- Автодополнение в командной строке
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
                { name = "cmdline" },
            }),
        })

        -- Автодополнение в поиске
        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })
    end,
}

