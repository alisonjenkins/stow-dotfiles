return {
	"nvim-treesitter/nvim-treesitter",
	config = true,
	build = ":TSUpdate",
	lazy = true,
	event = "VeryLazy",
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter-textobjects" },
		{
			"m-demare/hlargs.nvim",
			config = true,
			dependencies = { "nvim-treesitter/nvim-treesitter" },
		},
		{ "p00f/nvim-ts-rainbow" },
	},
}
