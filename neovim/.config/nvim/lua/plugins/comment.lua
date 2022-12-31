local M = {
	"numToStr/Comment.nvim",
	lazy = false,
}

function M.config()
	local ok, comment = pcall(require, "Comment")

	if not ok then
		return
	end

	comment.setup()
end

return M
