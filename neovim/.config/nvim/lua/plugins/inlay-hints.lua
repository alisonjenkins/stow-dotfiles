local M = {
  "simrat39/inlay-hints.nvim",
}

function M.config()
  local ok, inlay = pcall(require, "inlay-hints")
  if not ok then
    return
  end

  inlay.setup({
    only_current_line = true,

    eol = {
      right_align = true,
    },
  })
end

return M
