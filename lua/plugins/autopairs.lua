local M = {
  'windwp/nvim-autopairs',
}

M.dependencies = {
  'hrsh7th/nvim-cmp',
}

M.config = function()
  require('nvim-autopairs').setup {}
  local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
  local cmp = require 'cmp'
  cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
end

return M
