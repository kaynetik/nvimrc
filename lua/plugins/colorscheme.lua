local M = {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
}
M.init = function()
  vim.cmd.colorscheme 'catppuccin-frappe'
  vim.cmd.hi 'Comment gui=none'
  vim.o.termguicolors = true
end

return M
