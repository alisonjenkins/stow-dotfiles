local M = {
  "lewis6991/gitsigns.nvim",
  lazy = true,
  event = "BufRead",
}

function M.config()
  require("gitsigns").setup({
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "right_align",
      delay = 300,
    }
  })
end

return M
