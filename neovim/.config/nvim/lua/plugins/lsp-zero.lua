return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v2.x",
  dependencies = {
    { "neovim/nvim-lspconfig" },
    {
      "williamboman/mason.nvim",
      build = function()
        pcall(vim.cmd, "MasonUpdate")
      end,
    },
    { "williamboman/mason-lspconfig.nvim" },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "L3MON4D3/LuaSnip" },
    { "lukas-reineke/lsp-format.nvim" },
    "MunifTanjim/rust-tools.nvim",
  },
  config = function()
    local lsp = require("lsp-zero").preset({})
    local exclude_formatting_lsps = {
      "copilot",
      "groovyls",
    }

    local on_attach = function(client, bufnr)
      lsp.default_keymaps({ buffer = bufnr })

      vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', { buffer = true })

      if not vim.tbl_contains(exclude_formatting_lsps, client.name) then
        require('lsp-format').on_attach(client)
      end
    end

    lsp.on_attach(on_attach)

    lsp.set_sign_icons({
      error = "✘",
      warn = "▲",
      hint = "⚑",
      info = "»",
    })

    lsp.ensure_installed({
    })

    -- (Optional) Configure lua language server for neovim
    require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

    lsp.skip_server_setup({ 'rust-analyzer', "sumneko_lua" })

    lsp.setup()

    local rust_tools = require('rust-tools')
    rust_tools.setup({
      server = {
        on_attach = on_attach
      }
    })
  end,
}
