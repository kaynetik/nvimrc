local M = {
  'natecraddock/workspaces.nvim',
}

M.config = function()
  require('workspaces').setup {
    autodetect = true,
    hooks = {
      open = function()
        local wsp = require('workspaces').path()
        vim.notify('Setting WorksSpace path to: ' .. wsp, vim.log.levels.INFO)
        vim.g.WORKSPACE_ROOT_PATH = wsp

        require('telescope.builtin').find_files()
      end,
    },
  }
end

return M
