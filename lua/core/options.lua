local opt = vim.opt -- Удобный псевдоним для настроек

-- Включаем относительные номера строк (помогает прыгать по коду)
opt.relativenumber = true
opt.number = true

-- Настройка отступов (стандарт для .NET — 4 пробела)
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- Интерфейс
opt.termguicolors = true -- Поддержка 24-битного цвета
opt.cursorline = true    -- Подсветка строки с курсором
opt.scrolloff = 8        -- Оставлять 8 строк при скролле до края

-- Таймаут
opt.timeoutlen = 300 -- Ждать 300 мс перед тем, как решить, что это не комбинация
