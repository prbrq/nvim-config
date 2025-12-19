-- Путь для установки lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Проверяем, установлен ли lazy.nvim
if not vim.loop.fs_stat(lazypath) then
    -- Если нет, клонируем из GitHub
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",  -- partial clone для скорости
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",     -- используем стабильную ветку
        lazypath,
    })
end

-- Добавляем lazy.nvim в runtimepath
vim.opt.rtp:prepend(lazypath)

-- Настраиваем lazy.nvim
require("lazy").setup({
    -- Здесь lazy автоматически импортирует все файлы из lua/plugins/
    { import = "plugins" },
}, {
    -- Опции lazy.nvim
    checker = {
        enabled = true,      -- автоматически проверять обновления
        notify = false,      -- не показывать уведомления
    },
    change_detection = {
        notify = false,      -- не уведомлять об изменениях конфига
    },
})

