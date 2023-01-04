return {
	"nathom/filetype.nvim",
	lazy = false,
	config = function()
		require("filetype").setup({
			overrides = {
				extensions = {
					tf = "terraform",
					tfvars = "terraform",
				},
			},
		})
	end,
}
