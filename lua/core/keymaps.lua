-- Устанавливаем Лидер — Пробел
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap -- Псевдоним для краткости

-- Общий формат: keymap.set(режим, "сочетание", "действие", опции)

-- 1. Выход из режима вставки (теперь не нужно тянуться к Esc)
keymap.set("i", ";;", "<ESC>", { desc = "Выход в Normal mode через jk" })

-- 2. Очистка подсветки поиска (когда нашел слово, оно горит — нажми Лидер + n)
keymap.set("n", "<leader>nh", ":nohlsearch<CR>", { desc = "Убрать подсветку поиска" })

-- 3. Управление окнами (split)
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Разделить окно вертикально" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Разделить окно горизонтально" })
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Закрыть текущее окно" })
