local M = {
  'rcarriga/nvim-notify',
}

M.keys = {
  {
    '<leader>un',
    function()
      require('notify').dismiss { silent = true, pending = true }
    end,
    desc = 'Dismiss All Notifications',
  },
}

M.opts = {
  stages = 'static',
  timeout = 2000,
  max_height = function()
    return math.floor(vim.o.lines * 0.75)
  end,
  max_width = function()
    return math.floor(vim.o.columns * 0.75)
  end,
  on_open = function(win)
    vim.api.nvim_win_set_config(win, { zindex = 100 })
  end,
}

-- TODO: Fix to make this one on VeryLazy.
-- M.init = function()
--   -- when noice is not enabled, install notify on VeryLazy
--   local lazyvim = require('lazyvim')
--   if lazyvim.has 'noice.nvim' then
--     lazyvim.on_very_lazy(function()
--       vim.notify = require 'notify'
--     end)
--   end
-- end

return M
