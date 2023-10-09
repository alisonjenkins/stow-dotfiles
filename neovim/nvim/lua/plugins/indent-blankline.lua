local M = {
	"lukas-reineke/indent-blankline.nvim",
	lazy = true,
	event = "BufRead",
	main = "ibl",
	opts = {},
}

function M.config()
	require("ibl").setup()
	vim.opt.list = true
	vim.opt.listchars:append("eol:↴")
end

return M
