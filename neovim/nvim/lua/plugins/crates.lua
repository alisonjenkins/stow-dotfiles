local M = {
  "saecki/crates.nvim",
  event = { "BufRead Cargo.toml" },
  dependencies = { { "nvim-lua/plenary.nvim" } },
}

function M.config()
  local ok, crates = pcall(require, "crates")

  if not ok then
    return
  end

  crates.setup()
end

return M
