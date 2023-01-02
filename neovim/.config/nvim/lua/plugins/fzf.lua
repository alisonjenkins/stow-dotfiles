local M = {
  "junegunn/fzf",
  lazy = true,
  build = function()
    vim.fn["fzf#install"]()
  end,
}

return M
