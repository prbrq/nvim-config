return {
    "folke/tokyonight.nvim",
    priority = 1000,  -- загружается первым, до всех остальных
    config = function()
        -- Эта функция выполнится после загрузки плагина
        require("tokyonight").setup({
            style = "night",
            transparent = false,
        })
        
        -- Применяем цветовую схему
        vim.cmd([[colorscheme tokyonight]])
    end,
}
