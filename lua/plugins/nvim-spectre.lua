local M = {
  'nvim-pack/nvim-spectre',
  build = false,
  cmd = 'Spectre',
}
M.opts = { open_cmd = 'noswapfile vnew' }
M.keys = {
  {
    '<leader>sr',
    function()
      require('spectre').open()
    end,
    desc = 'Replace in Files (Spectre)',
  },
}

return M
