local M = {
  "sainnhe/everforest",
  lazy = true,
}

function M.config()
  vim.g.everforest_background = "soft"
  vim.g.everforest_better_performance = true
  vim.g.everforest_diagnostic_text_highlight = true
  vim.g.everforest_transparent_background = true
end

return M
