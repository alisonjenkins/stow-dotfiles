-- vim: set foldmethod=marker foldlevel=0:

local neodev_ok, neodev = pcall(require, "neodev")
if neodev_ok then
  neodev.setup({})
end

local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
local lsp_defaults = lspconfig.util.default_config

if not lspconfig_ok then
  return
end

local function custom_capabilities() --{{{
  local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if not cmp_nvim_lsp_ok then
    return vim.tbl_deep_extend("force", lsp_defaults.capabilities, vim.lsp.protocol.make_client_capabilities())
  end

  local capabilities = cmp_nvim_lsp.default_capabilities()
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }

  return capabilities
end --}}}

local function custom_on_attach(client, bufnr) --{{{
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })

  require("lsp-format").on_attach(client)
  require("lsp_signature").on_attach()
  require("inlay-hints").on_attach(client, bufnr)
end

--}}}

--}}}

local function default(configs) --{{{
  -- local custom_config = {
  --   on_attach = custom_on_attach,
  --   capabilities = custom_capabilities(),
  -- }
  local custom_config = {}
  if configs ~= nil then
    for key, value in pairs(configs) do
      if value ~= nil then
        custom_config[key] = value
      end
    end
  end

  return custom_config
end --}}}

local lsp_servers = {}

-- {{{ Bash
lsp_servers["bashls"] = {}
-- }}}

-- {{{ C
lsp_servers["clangd"] = {}
-- }}}

-- {{{ CSS
lsp_servers["cssls"] = {}
-- }}}

-- {{{ Docker
lsp_servers["dockerls"] = {}
-- }}}

-- {{{ Go
lsp_servers["gopls"] = {
  gopls = {
    hints = {
      assignVariableTypes = true,
      compositeLiteralFields = true,
      compositeLiteralTypes = true,
      constantValues = true,
      functionTypeParameters = true,
      parameterNames = true,
      rangeVariableTypes = true,
    },
  },
}
-- }}}

-- {{{ Groovy
lsp_servers["groovyls"] = {}
-- }}}

-- {{{ HTML
lsp_servers["html"] = {}
-- }}}

-- {{{ JSON
lsp_servers["jsonls"] = {}
-- }}}

-- {{{ Lua

lsp_servers["sumneko_lua"] = {
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace",
      },
      hint = {
        enable = true,
      },
    },
  },
}
-- }}}

---- {{{ Python - Pyright
lsp_servers["pyright"] = {}
-- }}}

---- {{{ SQL
lsp_servers["sqls"] = {}
-- }}}

-- {{{ Terraform
lsp_servers["terraformls"] = {}
-- }}}

-- {{{ Tex
lsp_servers["texlab"] = {}
-- }}}

-- {{{ Typescript
lsp_servers["tsserver"] = {}
-- }}}

-- {{{ Vim
lsp_servers["vimls"] = {}
-- }}}

-- {{{ YAML
lsp_servers["yamlls"] = {}
-- }}}

require("toggle_lsp_diagnostics").init({ underline = false, virtual_text = { spacing = 4 } })

----{{{ LSP setup
for lsp_name, lsp_settings in pairs(lsp_servers) do
  if lsp_name == "sumneko_lua" then
    lspconfig.sumneko_lua.setup({
      settings = {
        Lua = {
          completion = {
            callSnippet = "Replace",
          },
        },
      },
    })
  else
    lspconfig[lsp_name].setup(default(lsp_settings))
  end
end
--}}}
