require("mason-lspconfig").setup({
  automatic_installation = true,

  ensure_installed = {
    "bash-debug-adapter",
    "bash-language-server",
    "black",
    "clangd",
    "css-lsp",
    "dockerfile-language-server",
    "gitlint",
    "go-debug-adapter",
    "gofumpt",
    "goimports",
    "golangci-lint",
    "golangci-lint-langserver",
    "golines",
    "gomodifytags",
    "gopls",
    "gotests",
    "groovy-language-server",
    "html-lsp",
    "isort",
    "jdtls",
    "json-lsp",
    "lua-language-server",
    "markdownlint",
    "prettierd",
    "pyright",
    "rome",
    "rust-analyzer",
    "shellcheck",
    "shellharden",
    "shfmt",
    "sqls",
    "stylua",
    "sumneko_lua",
    "terraform-ls",
    "texlab",
    "tflint",
    "typescript-language-server",
    "vim-language-server",
    "write-good",
    "yaml-language-server",
  },
})

require("mason-lspconfig").setup_handlers({
  function(server_name)
    require("lspconfig")[server_name].setup({})
  end,
  -- ["rust_analyzer"] = function()
  --   require("rust-tools").setup({})
  -- end,
  ["gopls"] = function()
    require("go").setup({})
  end,
  ["sumneko_lua"] = function()
    local neodev = require("neodev").setup({})
    require("lspconfig").sumneko_lua.setup(neodev)
  end,
})
