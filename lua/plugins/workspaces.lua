return {
  -- TODO: Play a bit with this one to confirm it's working as expected!
  {
    'natecraddock/workspaces.nvim',
    config = function()
      require('workspaces').setup {
        autodetect = true,
        hooks = {
          open = function()
            local wsp = require('workspaces').path()
            print('Setting workspace path to: ' .. wsp)
            vim.g.WORKSPACE_ROOT_PATH = wsp

            require('telescope.builtin').find_files()
          end,
          -- open = 'Telescope find_files',
        },
      }
    end,
  },
}
