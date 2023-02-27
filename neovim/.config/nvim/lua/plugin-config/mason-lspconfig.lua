local ok, mlspconfig = pcall(require, "mason-lspconfig")

if not ok then
	return
end

mlspconfig.setup({
	automatic_installation = true,

	ensure_installed = {
		-- "bash-debug-adapter",
		-- "bash-language-server",
		-- "black",
		"clangd",
		-- "css-lsp",
		-- "dockerfile-language-server",
		-- "gitlint",
		-- "go-debug-adapter",
		-- "gofumpt",
		-- "goimports",
		-- "golangci-lint",
		-- "golangci-lint-langserver",
		-- "golines",
		-- "gomodifytags",
		"gopls",
		-- "gotests",
		-- "groovy-language-server",
		-- "html-lsp",
		-- "isort",
		"jdtls",
		-- "json-lsp",
		-- "lua-language-server",
		-- "markdownlint",
		-- "prettierd",
		"pyright",
		"rome",
		-- "rust-analyzer",
		-- "shellcheck",
		-- "shellharden",
		-- "shfmt",
		"sqls",
		-- "stylua",
		"lua_ls",
		-- "terraform-ls",
		"texlab",
		"tflint",
		-- "typescript-language-server",
		-- "vim-language-server",
		-- "write-good",
		-- "yaml-language-server",
	},
})
