local M = {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  lazy = true,
  ft = "norg",
  dependencies = "nvim-lua/plenary.nvim",
}

function M.config()
  local ok, neorg = pcall(require, "neorg")

  if not ok then
    return
  end

  neorg.setup({
    -- Tell Neorg what modules to load
    load = {
      ["core.defaults"] = {}, -- Load all the default modules
      ["core.concealer"] = {}, -- Allows for use of icons
      ["core.dirman"] = { -- Manage your directories with Neorg
        config = {
          workspaces = {
            work = "~/Documents/gtd/work",
          },
        },
      },
      -- ["core.gtd.base"] = {
      --   config = {
      --     workspace = "work",
      --   },
      -- },
    },
  })
end

return M
