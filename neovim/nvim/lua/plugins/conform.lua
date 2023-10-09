return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_fallback = true,
			},
			formatters_by_ft = {
				go = { "goimports", "golines", "gofmt", "gofumpt" },
				javascript = { { "prettierd", "prettier" } },
				lua = { "stylua" },
				sh = { "shfmt" },
				terraform = { "terraform_fmt" },
				rust = { "rustfmt" },
				python = { "isort", "black" },
			},
		})
	end,
}
