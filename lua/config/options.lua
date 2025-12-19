-- Общие настройки
vim.opt.number = true                -- показать номера строк
vim.opt.relativenumber = true        -- относительная нумерация
vim.opt.mouse = "a"                  -- включить мышь
vim.opt.ignorecase = true            -- игнорировать регистр при поиске
vim.opt.smartcase = true             -- но учитывать, если есть заглавные

-- Табуляция и отступы
vim.opt.tabstop = 4                  -- ширина табуляции
vim.opt.shiftwidth = 4               -- ширина автоотступа
vim.opt.expandtab = true             -- использовать пробелы вместо табов
vim.opt.smartindent = true           -- умные отступы

-- Интерфейс
vim.opt.termguicolors = true         -- 24-bit цвета
vim.opt.signcolumn = "yes"           -- всегда показывать колонку знаков (для LSP)
vim.opt.cursorline = true            -- подсветка текущей строки

-- Буферы и окна
vim.opt.hidden = true                -- разрешить скрытые буферы
vim.opt.splitright = true            -- вертикальные сплиты справа
vim.opt.splitbelow = true            -- горизонтальные сплиты снизу

