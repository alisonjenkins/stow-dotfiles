local M = {
  "alvarosevilla95/luatab.nvim",
  lazy = true,
  event = "TabNew",
  dependencies = { "kyazdani42/nvim-web-devicons" },
}

function M.config()
  local ok, luatab = pcall(require, "luatab")

  if not ok then
    return
  end

  luatab.setup({})
end

return M
