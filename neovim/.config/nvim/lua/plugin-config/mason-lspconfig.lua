require("mason-lspconfig").setup({
  automatic_installation = true,
})
require("mason-lspconfig").setup_handlers({
  function(server_name)
    require("lspconfig")[server_name].setup({})
  end,
  ["rust_analyzer"] = function()
    require("rust-tools").setup({})
  end,
  ["gopls"] = function()
    require("go").setup({})
  end,
  ["sumneko_lua"] = function()
    local luadev = require("lua-dev").setup({})
    require("lspconfig").sumneko_lua.setup(luadev)
  end,
})
