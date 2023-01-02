local M = {
  "lukas-reineke/indent-blankline.nvim",
  lazy = true,
  event = "BufRead",
}

function M.config()
  local ok, indent = pcall(require, "indent_blankline")
  if not ok then
    return
  end

  indent.setup({
    show_current_context = true,
    show_current_context_start = true,
    show_end_of_line = true,
  })
  vim.opt.list = true
  vim.opt.listchars:append("eol:↴")
end

return M
