-- vim: set foldmethod=marker foldlevel=0:

local function custom_capabilities() --{{{
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
  return capabilities
end --}}}

local function custom_on_attach(client, _) --{{{
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })

  require("lsp-format").on_attach(client)
  require("lsp_signature").on_attach()
end

--}}}

--}}}

local function default(configs) --{{{
  local custom_config = {
    on_attach = custom_on_attach,
    capabilities = custom_capabilities(),
  }
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
lsp_servers["gopls"] = {}
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
lsp_servers["sumneko_lua"] = {}
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
local lspconfig = require("lspconfig")

for lsp_name, lsp_settings in pairs(lsp_servers) do
  lspconfig[lsp_name].setup(lsp_settings)
end
--}}}
