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
    -- { 'LazyVim/LazyVim', import = 'lazyvim.plugins' },
    { import = 'plugins' },
    { import = 'plugins.neotree' }, -- override default one from lazyvim.plugins
    { import = 'plugins.colorscheme' },
    -- { import = 'lazyvim.plugins.extras.ui.mini-animate' },
    -- { import = 'lazyvim.plugins.extras.coding.copilot' },
    --
    { import = 'kickstart.plugins.debug' },
    { import = 'kickstart.plugins.indent_line' },
    { import = 'kickstart.plugins.lint' },
    -- { import = 'plugins.copilot' },
  },
  defaults = {
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  -- install = { colorscheme = { 'tokyonight', 'habamax', 'cattpuccin' } },
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

-- vim: ts=2 sts=2 sw=2 et
