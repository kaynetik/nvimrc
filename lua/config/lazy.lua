--
-- -- [[ Configure and install plugins ]]
-- --
-- --  To check the current status of your plugins, run
-- --    :Lazy
-- --
-- --  You can press `?` in this menu for help. Use `:q` to close the window
-- --
-- --  To update plugins you can run
-- --    :Lazy update
-- --

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  spec = {
    -- add LazyVim and import its plugins
    { 'LazyVim/LazyVim', import = 'lazyvim.plugins' },
    {
      require 'kickstart.plugins.debug',
      require 'kickstart.plugins.indent_line',
      require 'kickstart.plugins.lint',
    },
    -- import any extras modules here
    { import = 'plugins', 'custom.plugins', 'lazyvim.plugins.extras.ui.mini-animate' },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { 'tokyonight', 'habamax' } },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        'gzip',
        -- "matchit",
        -- "matchparen",
        'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
