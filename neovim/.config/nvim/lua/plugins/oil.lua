local M = {
	"stevearc/oil.nvim",
	lazy = true,
	keys = { "-" },
}

function M.config()
	require("oil").setup({
		columns = {
			"icon",
		},
		skip_confirm_for_simple_edits = true,
	})
	vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
end

return M
