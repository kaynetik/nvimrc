local M = {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  build = ':Copilot auth',
}

M.opts = {
  suggestion = {
    enabled = true,
    auto_trigger = true,
  },
  panel = { enabled = false },
}

-- Keymap to accept a suggestion
local function set_keymaps()
  local opts = { noremap = true, silent = true }
  -- This maps Ctrl-Shift-y to accept the current suggestion
  vim.api.nvim_set_keymap('i', '<C-S-y>', 'copilot#Accept("<CR>")', opts)
end

-- Ensure the keymaps are set after Copilot is loaded
vim.api.nvim_create_autocmd('User', {
  pattern = 'CopilotReady',
  callback = set_keymaps,
})

return M
