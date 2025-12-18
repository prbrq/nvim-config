return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require('telescope.builtin')
    -- Настроим быстрый поиск файлов по Лидер + ff (find files)
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    -- Поиск текста внутри файлов по Лидер + fg (live grep)
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
  end
}
