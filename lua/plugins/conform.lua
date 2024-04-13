local M = {
  'stevearc/conform.nvim',
}

M.opts = {
  notify_on_error = false,
  format_on_save = function(bufnr)
    -- Disable "format_on_save lsp_fallback" for languages that don't
    -- have a well standardized coding style.
    local disable_filetypes = { c = true, cpp = true }
    return {
      timeout_ms = 150,
      lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
    }
  end,
  formatters_by_ft = {
    lua = { 'stylua' },
    go = { 'goimports', 'gofmt' },
    javascript = { { 'prettierd', 'prettier' } },
    -- Determine the formatters dynamically.
    python = function(bufnr)
      if require('conform').get_formatter_info('ruff_format', bufnr).available then
        return { 'ruff_format' }
      else
        return { 'isort', 'black' }
      end
    end,
    -- Use the "*" filetype to run formatters on all filetypes.
    ['*'] = { 'codespell' },
    -- Use the "_" filetype to run formatters on filetypes that don't
    -- have other formatters configured.
    ['_'] = { 'trim_whitespace' },
  },
}

M.keys = {
  {
    '<leader>f',
    function()
      require('conform').format { async = true, lsp_fallback = true }
    end,
    mode = '',
    desc = 'Format buffer',
  },
}

return M
