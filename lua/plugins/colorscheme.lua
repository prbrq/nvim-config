return {
  "folke/tokyonight.nvim",
  lazy = false,    -- Тема должна загружаться сразу при старте
  priority = 1000, -- И иметь высший приоритет
  config = function()
    vim.cmd([[colorscheme tokyonight]])
  end,
}
