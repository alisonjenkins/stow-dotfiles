local ok, neorg = pcall(require,"neorg")

if not ok then
	return
end

neorg.setup({
  -- Tell Neorg what modules to load
  load = {
    ["core.defaults"] = {}, -- Load all the default modules
    ["core.norg.concealer"] = {}, -- Allows for use of icons
    ["core.norg.dirman"] = { -- Manage your directories with Neorg
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
