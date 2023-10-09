return {
	"luckasRanarison/nvim-devdocs",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {},
	config = function()
		require("nvim-devdocs").setup({
			ensure_installed = {
				"ansible",
				"bash",
				"rust",
				"terraform",
			},
		})
	end,
}
