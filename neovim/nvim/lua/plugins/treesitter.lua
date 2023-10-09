return {
	"nvim-treesitter/nvim-treesitter",
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

		config = function()
			local ts = require("nvim-treesitter.configs")
			ts.setup({
				auto_install = true,
				sync_install = false,
				ensure_installed = {
					"maintained",
				},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
			})
		end,
	},
}
