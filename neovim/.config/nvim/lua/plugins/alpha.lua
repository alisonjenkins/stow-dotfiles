local M = {
  "goolord/alpha-nvim",
  dependencies = { "kyazdani42/nvim-web-devicons" },
  lazy = false,
  priority = 1001,
}

function M.config()
  local ok, alpha = pcall(require, "alpha")
  if not ok then
    return
  end
  alpha.setup(require("alpha.themes.startify").opts)
end

return M
