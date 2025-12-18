-- 1. Определяем путь, куда скачается Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- 2. Если папка не существует, скачиваем её через Git
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  print("Установка Lazy.nvim...")
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
  print("Установка завершена.")
end

-- 3. Добавляем путь к Lazy.nvim в runtimepath, чтобы NeoVim его увидел
vim.opt.rtp:prepend(lazypath)

-- 4. И только ТЕПЕРЬ вызываем require
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
})
