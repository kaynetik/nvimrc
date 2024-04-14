local M = {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  build = ':Copilot auth',
  event = 'VeryLazy',
}

M.opts = {
  panel = {
    title = 'Copilot',
    enabled = false,
    auto_refresh = false,
    keymap = {
      jump_prev = '[[',
      jump_next = ']]',
      accept = '<CR>',
      refresh = 'gr',
      open = '<M-CR>',
    },
    layout = {
      position = 'bottom', -- | top | left | right
      ratio = 0.4,
    },
  },

  suggestion = {
    enabled = false,
    auto_trigger = true,
    debounce = 75,
    keymap = {
      accept = '<leader>la',
      accept_word = false,
      accept_line = false,
      next = '<leader>l]',
      prev = '<leader>l[>',
      dismiss = false,
    },
  },
}

M.config = function()
  require('copilot').setup(M.opts)
end

return M
