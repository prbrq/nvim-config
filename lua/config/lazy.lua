-- Файл: lua/config/lazy.lua

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

-- Настраиваем lazy.nvim
require("lazy").setup({
    -- Импорт из корня plugins/
    { import = "plugins" },
    
    -- Явно импортируем подпапки
    { import = "plugins.lsp" },
    
    -- Можно добавить и другие подпапки
    -- { import = "plugins.ui" },
    -- { import = "plugins.editor" },
}, {
    checker = {
        enabled = true,
        notify = false,
    },
    change_detection = {
        notify = false,
    },
})

