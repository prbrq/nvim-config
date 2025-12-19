return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",  -- загрузится только при входе в Insert режим
    dependencies = {
        "hrsh7th/cmp-buffer",       -- источник: текст из буферов
        "hrsh7th/cmp-path",         -- источник: пути файлов
    },
    config = function()
        local cmp = require("cmp")
        
        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources({
                { name = "buffer" },
                { name = "path" },
            }),
        })
    end,
}
