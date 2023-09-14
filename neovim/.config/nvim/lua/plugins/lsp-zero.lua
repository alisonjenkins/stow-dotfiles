return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v3.x",
  dependencies = {
    { "neovim/nvim-lspconfig" },
    {
      "williamboman/mason.nvim",
      build = function()
        pcall(vim.cmd, "MasonUpdate")
      end,
    },
    {
      'ray-x/navigator.lua',
      requires = {
        { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
        { 'neovim/nvim-lspconfig' },
        { 'nvim-treesitter/nvim-treesitter'},
      }
    },
    { "williamboman/mason-lspconfig.nvim" },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "L3MON4D3/LuaSnip" },
    { "MunifTanjim/rust-tools.nvim", branch = "patched", },
  },
  config = function()
    local lsp_zero = require("lsp-zero")

    lsp_zero.on_attach(function(client, bufnr)
      -- see :help lsp-zero-keybindings
      -- to learn the available actions
      lsp_zero.default_keymaps(
        {
          buffer = bufnr,
          preserve_mappings = false
        }
      )
      vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', { buffer = true })
    end)

    local exclude_formatting_lsps = {
      "copilot",
      "groovyls",
    }

    lsp_zero.set_sign_icons({
      error = "✘",
      warn = "▲",
      hint = "⚑",
      info = "»",
    })

    require('mason').setup({})
    require('mason-lspconfig').setup({
      ensure_installed = {},
      handlers = {
        lsp_zero.default_setup,
        rust_analyzer = function()
          local rust_tools = require('rust-tools')

          rust_tools.setup({
            server = {
              on_attach = function(client, bufnr)
                vim.keymap.set('n', '<leader>ca', rust_tools.hover_actions.hover_actions, {buffer = bufnr})
              end
            }
          })
        end
      },
    })

  end,
}
