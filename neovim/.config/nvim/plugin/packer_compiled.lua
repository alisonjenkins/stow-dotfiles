-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = true
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/alan/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/alan/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/alan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/alan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/alan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { 'require("plugin-config/comment")' },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    config = { 'require("plugin-config/luasnip")' },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["alpha-nvim"] = {
    config = { "\27LJ\2\n^\0\0\5\0\5\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\0\0'\4\3\0B\2\2\0029\2\4\2B\0\2\1K\0\1\0\topts\26alpha.themes.startify\nsetup\nalpha\frequire\0" },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim",
    wants = { "nvim-web-devicons" }
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-fuzzy-buffer"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/cmp-fuzzy-buffer",
    url = "https://github.com/tzachar/cmp-fuzzy-buffer"
  },
  ["cmp-fuzzy-path"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/cmp-fuzzy-path",
    url = "https://github.com/tzachar/cmp-fuzzy-path"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-document-symbol"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-document-symbol",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-pandoc.nvim"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/cmp-pandoc.nvim",
    url = "https://github.com/aspeddro/cmp-pandoc.nvim"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-spell"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/cmp-spell",
    url = "https://github.com/f3fora/cmp-spell"
  },
  ["cmp-tabnine"] = {
    config = { 'require("plugin-config/tabnine")' },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/cmp-tabnine",
    url = "https://github.com/tzachar/cmp-tabnine"
  },
  ["cmp-tmux"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/cmp-tmux",
    url = "https://github.com/andersevenrud/cmp-tmux"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["committia.vim"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/committia.vim",
    url = "https://github.com/rhysd/committia.vim"
  },
  ["copilot-cmp"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/alan/.local/share/nvim/site/pack/packer/opt/copilot-cmp",
    url = "https://github.com/zbirenbaum/copilot-cmp"
  },
  ["copilot.lua"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fcopilot\frequire-\1\0\4\0\3\0\0066\0\0\0009\0\1\0003\2\2\0)\3d\0B\0\3\1K\0\1\0\0\rdefer_fn\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/alan/.local/share/nvim/site/pack/packer/opt/copilot.lua",
    url = "https://github.com/zbirenbaum/copilot.lua"
  },
  ["crates.nvim"] = {
    after_files = { "/home/alan/.local/share/nvim/site/pack/packer/opt/crates.nvim/after/plugin/cmp_crates.lua" },
    config = { 'require("plugin-config/crates")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/alan/.local/share/nvim/site/pack/packer/opt/crates.nvim",
    url = "https://github.com/saecki/crates.nvim"
  },
  everforest = {
    config = { 'require("plugin-config/everforest")' },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/everforest",
    url = "https://github.com/sainnhe/everforest"
  },
  ["fidget.nvim"] = {
    config = { 'require("plugin-config/fidget")' },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["filetype.nvim"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/filetype.nvim",
    url = "https://github.com/nathom/filetype.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["fugitive-gitlab.vim"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/fugitive-gitlab.vim",
    url = "https://github.com/shumphrey/fugitive-gitlab.vim"
  },
  ["fuzzy.nvim"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/fuzzy.nvim",
    url = "https://github.com/tzachar/fuzzy.nvim"
  },
  fzf = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzy-lua-native"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/fzy-lua-native",
    url = "https://github.com/romgrk/fzy-lua-native"
  },
  ["gina.vim"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/gina.vim",
    url = "https://github.com/lambdalisue/gina.vim"
  },
  ["gist-vim"] = {
    commands = { "Gist" },
    config = { 'require("plugin-config/gist")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/alan/.local/share/nvim/site/pack/packer/opt/gist-vim",
    url = "https://github.com/mattn/gist-vim",
    wants = { "webapi-vim" }
  },
  ["git-blame.nvim"] = {
    config = { 'require("plugin-config/git-blame")' },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/git-blame.nvim",
    url = "https://github.com/f-person/git-blame.nvim"
  },
  ["git-messenger.vim"] = {
    commands = { "GitMessenger" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/alan/.local/share/nvim/site/pack/packer/opt/git-messenger.vim",
    url = "https://github.com/rhysd/git-messenger.vim"
  },
  ["git-worktree.nvim"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/git-worktree.nvim",
    url = "https://github.com/ThePrimeagen/git-worktree.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { 'require("plugin-config/gitsigns")' },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["go.nvim"] = {
    config = { 'require("plugin-config/go")' },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/go.nvim",
    url = "https://github.com/ray-x/go.nvim"
  },
  harpoon = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/ThePrimeagen/harpoon"
  },
  ["hlargs.nvim"] = {
    config = { 'require("plugin-config/hlargs")' },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/hlargs.nvim",
    url = "https://github.com/m-demare/hlargs.nvim"
  },
  ["hop.nvim"] = {
    config = { 'require("plugin-config/hop")' },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["incline.nvim"] = {
    config = { 'require("plugin-config/incline")' },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/incline.nvim",
    url = "https://github.com/b0o/incline.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { 'require("plugin-config/indent-blankline")' },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["kanagawa.nvim"] = {
    config = { 'require("plugin-config/kanagawa")' },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/kanagawa.nvim",
    url = "https://github.com/rebelot/kanagawa.nvim"
  },
  ["lsp-format.nvim"] = {
    config = { 'require("plugin-config/lsp-format")' },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/lsp-format.nvim",
    url = "https://github.com/lukas-reineke/lsp-format.nvim"
  },
  ["lsp-trouble.nvim"] = {
    config = { 'require("plugin-config/trouble")' },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/lsp-trouble.nvim",
    url = "https://github.com/folke/lsp-trouble.nvim",
    wants = { "nvim-web-devicons", "nvim-lspconfig" }
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lua-dev.nvim"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/lua-dev.nvim",
    url = "https://github.com/folke/lua-dev.nvim"
  },
  ["lualine.nvim"] = {
    config = { 'require("plugin-config/lualine")' },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["luatab.nvim"] = {
    config = { 'require("plugin-config/luatab")' },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/luatab.nvim",
    url = "https://github.com/alvarosevilla95/luatab.nvim"
  },
  ["markdown-preview.nvim"] = {
    config = { 'require("plugin-config/markdown-preview")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/alan/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    config = { 'require("plugin-config/mason-lspconfig")' },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    config = { 'require("plugin-config/mason")' },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["mini.nvim"] = {
    config = { 'require("plugin-config/mini")' },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/mini.nvim",
    url = "https://github.com/echasnovski/mini.nvim"
  },
  ["nabla.nvim"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/nabla.nvim",
    url = "https://github.com/jbyuki/nabla.nvim"
  },
  neorg = {
    config = { 'require("plugin-config/neorg")' },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/neorg",
    url = "https://github.com/nvim-neorg/neorg"
  },
  ["neoscroll.nvim"] = {
    config = { 'require("plugin-config/neoscroll")' },
    keys = { { "", "<C-u>" }, { "", "<C-d>" }, { "", "<C-b>" }, { "", "<C-f>" }, { "", "<C-e>" }, { "", "zt" }, { "", "zz" }, { "", "zb" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/alan/.local/share/nvim/site/pack/packer/opt/neoscroll.nvim",
    url = "https://github.com/karb94/neoscroll.nvim"
  },
  ["null-ls.nvim"] = {
    config = { 'require("plugin-config/null-ls")' },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-cmp"] = {
    config = { 'require("plugin-config/cmp")' },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { 'require("plugin-config/colorizer")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/alan/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text",
    url = "https://github.com/theHamsta/nvim-dap-virtual-text"
  },
  ["nvim-gps"] = {
    config = { 'require("plugin-config/gps")' },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/nvim-gps",
    url = "https://github.com/SmiteshP/nvim-gps"
  },
  ["nvim-hlslens"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/nvim-hlslens",
    url = "https://github.com/kevinhwang91/nvim-hlslens"
  },
  ["nvim-lastplace"] = {
    config = { 'require("plugin-config/lastplace")' },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/nvim-lastplace",
    url = "https://github.com/ethanholz/nvim-lastplace"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    config = { 'require("plugin-config/lspconfig")' },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { 'require("plugin-config/treesitter")' },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter",
    wants = { "nvim-ts-rainbow" }
  },
  ["nvim-ts-rainbow"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/alan/.local/share/nvim/site/pack/packer/opt/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    config = { 'require("plugin-config/nvim-web-devicons")' },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["octo.nvim"] = {
    config = { 'require("plugin-config/octo")' },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/octo.nvim",
    url = "https://github.com/pwntester/octo.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["pandoc.nvim"] = {
    config = { 'require("plugin-config/pandoc")' },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/pandoc.nvim",
    url = "https://github.com/aspeddro/pandoc.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["project.nvim"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/project.nvim",
    url = "https://github.com/ahmedkhalf/project.nvim"
  },
  ["registers.nvim"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/registers.nvim",
    url = "https://github.com/tversteeg/registers.nvim"
  },
  ["rust-tools.nvim"] = {
    config = { 'require("plugin-config/rust-tools")' },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  tabular = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/tabular",
    url = "https://github.com/godlygeek/tabular"
  },
  ["telescope-dap.nvim"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/telescope-dap.nvim",
    url = "https://github.com/nvim-telescope/telescope-dap.nvim"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzy-native.nvim"
  },
  ["telescope-github.nvim"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/telescope-github.nvim",
    url = "https://github.com/nvim-telescope/telescope-github.nvim"
  },
  ["telescope-heading.nvim"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/telescope-heading.nvim",
    url = "https://github.com/crispgm/telescope-heading.nvim"
  },
  ["telescope-packer.nvim"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/telescope-packer.nvim",
    url = "https://github.com/nvim-telescope/telescope-packer.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope-zoxide"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/telescope-zoxide",
    url = "https://github.com/jvgrootveld/telescope-zoxide"
  },
  ["telescope.nvim"] = {
    config = { 'require("plugin-config/telescope")' },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim",
    wants = { "nvim-web-devicons" }
  },
  ["tmux.nvim"] = {
    config = { 'require("plugin-config/tmux")' },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/tmux.nvim",
    url = "https://github.com/aserowy/tmux.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { 'require("plugin-config/todo-comments")' },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["toggle-lsp-diagnostics.nvim"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/toggle-lsp-diagnostics.nvim",
    url = "https://github.com/WhoIsSethDaniel/toggle-lsp-diagnostics.nvim"
  },
  ["tokyonight.nvim"] = {
    config = { 'require("plugin-config/tokyonight")' },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["twilight.nvim"] = {
    config = { 'require("plugin-config/twilight")' },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/twilight.nvim",
    url = "https://github.com/folke/twilight.nvim"
  },
  ["vim-dirvish"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/vim-dirvish",
    url = "https://github.com/justinmk/vim-dirvish"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/vim-easy-align",
    url = "https://github.com/junegunn/vim-easy-align"
  },
  ["vim-fubitive"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/vim-fubitive",
    url = "https://github.com/tommcdo/vim-fubitive"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-grammarous"] = {
    commands = { "GrammarousCheck" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/alan/.local/share/nvim/site/pack/packer/opt/vim-grammarous",
    url = "https://github.com/rhysd/vim-grammarous"
  },
  ["vim-illuminate"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/alan/.local/share/nvim/site/pack/packer/opt/vim-illuminate",
    url = "https://github.com/RRethy/vim-illuminate"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/vim-polyglot",
    url = "https://github.com/sheerun/vim-polyglot"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/vim-sleuth",
    url = "https://github.com/tpope/vim-sleuth"
  },
  ["vim-speeddating"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/vim-speeddating",
    url = "https://github.com/tpope/vim-speeddating"
  },
  ["vim-terraform"] = {
    config = { 'require("plugin-config/terraform")' },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/vim-terraform",
    url = "https://github.com/hashivim/vim-terraform"
  },
  ["vim-terraform-completion"] = {
    config = { 'require("plugin-config/terraform-completion")' },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/vim-terraform-completion",
    url = "https://github.com/alanjjenkins/vim-terraform-completion"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  ["webapi-vim"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/webapi-vim",
    url = "https://github.com/mattn/webapi-vim"
  },
  ["which-key.nvim"] = {
    config = { 'require("plugin-config/which-key")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/alan/.local/share/nvim/site/pack/packer/opt/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["zen-mode.nvim"] = {
    config = { 'require("plugin-config/zen-mode")' },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^copilot_cmp"] = "copilot-cmp"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Config for: hlargs.nvim
time([[Config for hlargs.nvim]], true)
require("plugin-config/hlargs")
time([[Config for hlargs.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
require("plugin-config/cmp")
time([[Config for nvim-cmp]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\2\n^\0\0\5\0\5\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\0\0'\4\3\0B\2\2\0029\2\4\2B\0\2\1K\0\1\0\topts\26alpha.themes.startify\nsetup\nalpha\frequire\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)
-- Config for: nvim-lastplace
time([[Config for nvim-lastplace]], true)
require("plugin-config/lastplace")
time([[Config for nvim-lastplace]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
require("plugin-config/luasnip")
time([[Config for LuaSnip]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
require("plugin-config/gitsigns")
time([[Config for gitsigns.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
require("plugin-config/comment")
time([[Config for Comment.nvim]], false)
-- Config for: nvim-gps
time([[Config for nvim-gps]], true)
require("plugin-config/gps")
time([[Config for nvim-gps]], false)
-- Config for: mini.nvim
time([[Config for mini.nvim]], true)
require("plugin-config/mini")
time([[Config for mini.nvim]], false)
-- Config for: git-blame.nvim
time([[Config for git-blame.nvim]], true)
require("plugin-config/git-blame")
time([[Config for git-blame.nvim]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
require("plugin-config/mason")
time([[Config for mason.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
require("plugin-config/lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: twilight.nvim
time([[Config for twilight.nvim]], true)
require("plugin-config/twilight")
time([[Config for twilight.nvim]], false)
-- Config for: mason-lspconfig.nvim
time([[Config for mason-lspconfig.nvim]], true)
require("plugin-config/mason-lspconfig")
time([[Config for mason-lspconfig.nvim]], false)
-- Config for: tokyonight.nvim
time([[Config for tokyonight.nvim]], true)
require("plugin-config/tokyonight")
time([[Config for tokyonight.nvim]], false)
-- Config for: luatab.nvim
time([[Config for luatab.nvim]], true)
require("plugin-config/luatab")
time([[Config for luatab.nvim]], false)
-- Config for: pandoc.nvim
time([[Config for pandoc.nvim]], true)
require("plugin-config/pandoc")
time([[Config for pandoc.nvim]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
require("plugin-config/todo-comments")
time([[Config for todo-comments.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
require("plugin-config/lualine")
time([[Config for lualine.nvim]], false)
-- Config for: tmux.nvim
time([[Config for tmux.nvim]], true)
require("plugin-config/tmux")
time([[Config for tmux.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
require("plugin-config/telescope")
time([[Config for telescope.nvim]], false)
-- Config for: everforest
time([[Config for everforest]], true)
require("plugin-config/everforest")
time([[Config for everforest]], false)
-- Config for: lsp-trouble.nvim
time([[Config for lsp-trouble.nvim]], true)
require("plugin-config/trouble")
time([[Config for lsp-trouble.nvim]], false)
-- Config for: fidget.nvim
time([[Config for fidget.nvim]], true)
require("plugin-config/fidget")
time([[Config for fidget.nvim]], false)
-- Config for: vim-terraform-completion
time([[Config for vim-terraform-completion]], true)
require("plugin-config/terraform-completion")
time([[Config for vim-terraform-completion]], false)
-- Config for: octo.nvim
time([[Config for octo.nvim]], true)
require("plugin-config/octo")
time([[Config for octo.nvim]], false)
-- Config for: vim-terraform
time([[Config for vim-terraform]], true)
require("plugin-config/terraform")
time([[Config for vim-terraform]], false)
-- Config for: rust-tools.nvim
time([[Config for rust-tools.nvim]], true)
require("plugin-config/rust-tools")
time([[Config for rust-tools.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require("plugin-config/treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
require("plugin-config/indent-blankline")
time([[Config for indent-blankline.nvim]], false)
-- Config for: kanagawa.nvim
time([[Config for kanagawa.nvim]], true)
require("plugin-config/kanagawa")
time([[Config for kanagawa.nvim]], false)
-- Config for: lsp-format.nvim
time([[Config for lsp-format.nvim]], true)
require("plugin-config/lsp-format")
time([[Config for lsp-format.nvim]], false)
-- Config for: incline.nvim
time([[Config for incline.nvim]], true)
require("plugin-config/incline")
time([[Config for incline.nvim]], false)
-- Config for: cmp-tabnine
time([[Config for cmp-tabnine]], true)
require("plugin-config/tabnine")
time([[Config for cmp-tabnine]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
require("plugin-config/null-ls")
time([[Config for null-ls.nvim]], false)
-- Config for: neorg
time([[Config for neorg]], true)
require("plugin-config/neorg")
time([[Config for neorg]], false)
-- Config for: go.nvim
time([[Config for go.nvim]], true)
require("plugin-config/go")
time([[Config for go.nvim]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
require("plugin-config/nvim-web-devicons")
time([[Config for nvim-web-devicons]], false)
-- Config for: hop.nvim
time([[Config for hop.nvim]], true)
require("plugin-config/hop")
time([[Config for hop.nvim]], false)
-- Config for: zen-mode.nvim
time([[Config for zen-mode.nvim]], true)
require("plugin-config/zen-mode")
time([[Config for zen-mode.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gist lua require("packer.load")({'gist-vim'}, { cmd = "Gist", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitMessenger lua require("packer.load")({'git-messenger.vim'}, { cmd = "GitMessenger", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GrammarousCheck lua require("packer.load")({'vim-grammarous'}, { cmd = "GrammarousCheck", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> zb <cmd>lua require("packer.load")({'neoscroll.nvim'}, { keys = "zb", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> zz <cmd>lua require("packer.load")({'neoscroll.nvim'}, { keys = "zz", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> zt <cmd>lua require("packer.load")({'neoscroll.nvim'}, { keys = "zt", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <C-f> <cmd>lua require("packer.load")({'neoscroll.nvim'}, { keys = "<lt>C-f>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <C-e> <cmd>lua require("packer.load")({'neoscroll.nvim'}, { keys = "<lt>C-e>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <C-d> <cmd>lua require("packer.load")({'neoscroll.nvim'}, { keys = "<lt>C-d>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <C-u> <cmd>lua require("packer.load")({'neoscroll.nvim'}, { keys = "<lt>C-u>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <C-b> <cmd>lua require("packer.load")({'neoscroll.nvim'}, { keys = "<lt>C-b>", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'which-key.nvim', 'copilot.lua'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au CursorHold * ++once lua require("packer.load")({'vim-illuminate'}, { event = "CursorHold *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead Cargo.toml ++once lua require("packer.load")({'crates.nvim'}, { event = "BufRead Cargo.toml" }, _G.packer_plugins)]]
vim.cmd [[au BufReadPre * ++once lua require("packer.load")({'nvim-colorizer.lua'}, { event = "BufReadPre *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles(1) end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
