local M = {
  "lewis6991/gitsigns.nvim",
  lazy = true,
  event = "BufRead",
}

function M.config()
  require("gitsigns").setup()
end

return M
