local M = {
  "f-person/git-blame.nvim",
  lazy = true,
  event = "VeryLazy",
}

function M.config()
  vim.g.gitblame_enabled = 0
end

return M
