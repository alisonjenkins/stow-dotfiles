-- vim: set foldmethod=marker foldlevel=0:
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", lazypath })
    vim.fn.system({ "git", "-C", lazypath, "checkout", "tags/stable" }) -- last stable release
  end
end
vim.opt.rtp:prepend(lazypath)

local function get_plugin_config(name) --{{{
  return function()
    require(string.format("plugin-config/%s", name))
  end

  -- local file = loadfile(string.format("plugin-config/%s", name))
  -- if file ~= nil then
  --   return file
  -- end
  -- return nil
end --}}}

local plugins = {
  -- Lua caching {{{
  -- { "lewis6991/impatient.nvim" },
  -- }}}
  -- {{{ Neural AI completion
  -- {
  --   "dense-analysis/neural",
  --   config = get_plugin_config("neural"),
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "ElPiloto/significant.nvim",
  --   },
  --   rocks = { "lua-cjson" },
  -- },
  -- }}}
  -- Add restoration of last location in files {{{
  {
    "ethanholz/nvim-lastplace",
    config = get_plugin_config("lastplace"),
  },
  --}}}
  -- Alignment {{{
  -- TODO: Configure the mappings for this plugin.
  { "junegunn/vim-easy-align" },
  --}}}
  -- Key mapping {{{
  {
    "folke/which-key.nvim",
    lazy = false,
    config = get_plugin_config("which-key"),
  },
  --}}}
  -- Center Align code {{{
  { "shortcuts/no-neck-pain.nvim", version = "*", lazy = true, cmd = "NoNeckPain" },
  -- }}}
  -- Colour schemes {{{
  { "rebelot/kanagawa.nvim", lazy = false, priority = 1000, config = get_plugin_config("kanagawa") },
  { "folke/tokyonight.nvim", config = get_plugin_config("tokyonight"), lazy = true },
  { "sainnhe/everforest", config = get_plugin_config("everforest"), lazy = true },
  -- }}}
  -- Commenting {{{
  { "numToStr/Comment.nvim", config = get_plugin_config("comment"), lazy = true, keys = "gcc" },
  --}}}
  -- Completion {{{
  {
    "hrsh7th/nvim-cmp",
    config = get_plugin_config("cmp"),
    lazy = true,
    event = "InsertEnter",
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        dependencies = {
          "rafamadriz/friendly-snippets",
        },
        config = get_plugin_config("luasnip"),
      },
      "andersevenrud/cmp-tmux",
      "aspeddro/cmp-pandoc.nvim",
      "f3fora/cmp-spell",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      -- { "zbirenbaum/copilot-cmp", module = "copilot_cmp" },
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      { "tzachar/cmp-tabnine", build = "./install.sh", config = get_plugin_config("tabnine") },
      { "romgrk/fzy-lua-native", build = "make" },
      { "tzachar/cmp-fuzzy-buffer", dependencies = { "hrsh7th/nvim-cmp", "tzachar/fuzzy.nvim" } },
    },
  },
  -- }}}
  -- Startup Dashboard {{{
  {
    "goolord/alpha-nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    lazy = false,
    priority = 1001,
    config = get_plugin_config("alpha"),
  },
  -- }}}
  -- Neovim startup profiler {{{
  { "dstein64/vim-startuptime", cmd = "StartupTime" },
  -- }}}
  -- Tmux integration {{{
  {
    "aserowy/tmux.nvim",
    lazy = true,
    config = get_plugin_config("tmux"),
  },
  -- }}}
  -- Coloizer {{{
  {
    "norcalli/nvim-colorizer.lua",
    event = "BufReadPre",
    config = get_plugin_config("colorizer"),
  },
  -- }}}
  -- Detect indent {{{
  { "tpope/vim-sleuth" },
  -- }}}
  -- Faster filetypes plugin {{{
  { "nathom/filetype.nvim" },
  -- }}}
  -- File manager {{{
  { "elihunter173/dirbuf.nvim", lazy = true, keys = { "-" }, cmd = "Dirbuf" },
  --}}}
  -- Fuzzy finding {{{
  {
    "nvim-telescope/telescope.nvim",
    config = get_plugin_config("telescope"),
    lazy = true,
    event = "VeryLazy",
    dependencies = {
      "ThePrimeagen/git-worktree.nvim",
      "ahmedkhalf/project.nvim",
      "crispgm/telescope-heading.nvim",
      "jvgrootveld/telescope-zoxide",
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
      "nvim-telescope/telescope-dap.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-telescope/telescope-github.nvim",
      "nvim-telescope/telescope-packer.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      { "nvim-telescope/telescope-fzy-native.nvim", dependencies = { "romgrk/fzy-lua-native" } },
      { "kyazdani42/nvim-web-devicons" },
    },
  },
  {
    "junegunn/fzf",
    build = function()
      vim.fn["fzf#install"]()
    end,
  },
  --}}}
  -- Github Copilot {{{
  -- {
  --   "zbirenbaum/copilot.lua",
  --   event = { "VimEnter" },
  --   config = function()
  --     vim.defer_fn(function()
  --       require("copilot").setup()
  --     end, 100)
  --   end,
  -- },
  -- }}}
  -- Git integration {{{
  {
    "tpope/vim-fugitive",
    lazy = true,
    cmd = {
      "GBrowse",
      "GDelete",
      "GMove",
      "GRename",
      "Gdiffsplit",
      "Gedit",
      "Ggrep",
      "Git",
      "Glgrep",
      "Gread",
      "Gvdiffsplit",
      "Gwrite",
    },
    dependencies = {
      -- (vimscript) Plugin improve the git commit interface showing diffs to remind you want you are changing.
      "rhysd/committia.vim",
      -- (vimscript) Adds Fugitive Gbrowse support for Gitlab repos.,
      "shumphrey/fugitive-gitlab.vim",
      -- (vimscript) Adds Fugitive Gbrowse support for Bitbucket repos.
      "tommcdo/vim-fubitive",
      -- (vimscript) Adds Fugitive Gbrowse support for GitHub repos.
      "tpope/vim-rhubarb",
    },
  },
  {
    "mattn/gist-vim",
    dependencies = { "mattn/webapi-vim" },
    lazy = true,
    cmd = "Gist",
    config = get_plugin_config("gist"),
  },
  {
    "rhysd/git-messenger.vim",
    cmd = "GitMessenger",
  },
  {
    "f-person/git-blame.nvim",
    lazy = true,
    event = "VeryLazy",
    config = get_plugin_config("git-blame"),
  },
  -- {
  --   "lewis6991/gitsigns.nvim",
  --   config = get_plugin_config("gitsigns"),
  -- },
  { "lambdalisue/gina.vim" },
  {
    "pwntester/octo.nvim",
    lazy = true,
    cmd = "Octo",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "kyazdani42/nvim-web-devicons",
    },
    config = get_plugin_config("octo"),
  },
  --}}}
  -- Grammar checking {{{
  { "rhysd/vim-grammarous", cmd = "GrammarousCheck" },
  --}}}
  -- Highlight of use {{{
  { "RRethy/vim-illuminate", event = "CursorHold" },
  --}}}
  -- Indentation guides {{{
  {
    "lukas-reineke/indent-blankline.nvim",
    config = get_plugin_config("indent-blankline"),
  },
  -- }}}
  -- Inlay Hints {{{
  {
    "simrat39/inlay-hints.nvim",
    config = get_plugin_config("inlay-hints"),
  },
  -- }}}
  -- Language servers + LSP tools {{{
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    config = function()
      local dap = require("dap")
      local port = 32562

      local code_lldb_extension_path = vim.env.HOME .. "/.local/share/nvim/mason/packages/codelldb/"
      local codelldb_path = code_lldb_extension_path .. "extension/adapter/codelldb"
      -- local liblldb_path = code_lldb_extension_path .. "extension/lldb/lib/liblldb.so"

      dap.adapters.codelldb = {
        type = "server",
        port = port,
        executable = {
          command = codelldb_path,
          args = { "--port", port },
          -- On windows you may have to uncomment this:
          -- detached = false,
        },
      }

      dap.configurations.rust = {
        {
          name = "Launch file",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = true,
        },
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
      "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
      "folke/neodev.nvim",
      -- "hrsh7th/nvim-cmp",
      "onsails/lspkind-nvim",
      "ray-x/lsp_signature.nvim",
      "simrat39/inlay-hints.nvim",
      { "kevinhwang91/nvim-ufo", dependencies = "kevinhwang91/promise-async", config = get_plugin_config("nvim-ufo") },
      { url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim", config = get_plugin_config("lsp_lines") },
      { "rmagatti/goto-preview", config = get_plugin_config("goto-preview") },
      { "glepnir/lspsaga.nvim", config = get_plugin_config("lspsaga") },
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = get_plugin_config("null-ls"),
        dependencies = { "nvim-lua/plenary.nvim" },
      },
      { "williamboman/mason.nvim", config = get_plugin_config("mason") },
      {
        "williamboman/mason-lspconfig.nvim",
        config = get_plugin_config("mason-lspconfig"),
        dependencies = "williamboman/mason.nvim",
      },
      { "lukas-reineke/lsp-format.nvim", config = get_plugin_config("lsp-format") },
    },
    config = get_plugin_config("lspconfig"),
  },
  {
    "folke/lsp-trouble.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons", "nvim-lspconfig" },
    config = get_plugin_config("trouble"),
    cmd = {
      "Trouble",
      "TroubleClose",
      "TroubleRefresh",
      "TroubleToggle",
    },
    lazy = true,
  },
  {
    "j-hui/fidget.nvim",
    lazy = true,
    config = get_plugin_config("fidget"),
  },
  {
    "ray-x/go.nvim",
    config = get_plugin_config("go"),
    ft = "go",
    dependencies = {
      "ray-x/guihua.lua",
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "williamboman/mason-lspconfig.nvim",
    },
  },
  --}}}
  -- Markdown previews{{{
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = { "markdown" },
    config = get_plugin_config("markdown-preview"),
  },
  --}}}
  -- Mini modules {{{
  {
    "echasnovski/mini.nvim",
    config = get_plugin_config("mini"),
  },
  -- }}}
  -- Neorg (Neovim Org mode) {{{
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    lazy = true,
    ft = "norg",
    config = get_plugin_config("neorg"),
    dependencies = "nvim-lua/plenary.nvim",
  },
  -- }}}
  -- nvim-dev-webicons {{{
  {
    "kyazdani42/nvim-web-devicons",
    config = get_plugin_config("nvim-web-devicons"),
  },
  --}}}
  -- Per project marks {{{
  { "ThePrimeagen/harpoon", dependencies = { "nvim-lua/plenary.nvim" } },
  --}}}
  -- Vim Rest Console {{{
  { "diepm/vim-rest-console" },
  -- }}}
  -- Per split buffer names {{{
  { "b0o/incline.nvim", config = get_plugin_config("incline"), lazy = true, event = "VeryLazy" },
  -- }}}
  -- Search index overlay {{{
  {
    "kevinhwang91/nvim-hlslens",
    lazy = true,
    keys = { "/", "?" },
    config = get_plugin_config("nvim-hlslens"),
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  -- }}}
  -- Smooth scrolling {{{
  {
    "karb94/neoscroll.nvim",
    keys = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-e>", "zt", "zz", "zb" },
    config = get_plugin_config("neoscroll"),
  },
  --}}}
  -- Statusline {{{
  { "nvim-lualine/lualine.nvim", config = get_plugin_config("lualine") },
  --}}}
  -- Tabline {{{
  {
    "alvarosevilla95/luatab.nvim",
    config = get_plugin_config("luatab"),
    dependencies = { "kyazdani42/nvim-web-devicons" },
  },
  -- }}}
  -- Terraform Plugins {{{
  { "hashivim/vim-terraform", config = get_plugin_config("terraform"), lazy = true, ft = "terraform" },
  {
    "alanjjenkins/vim-terraform-completion",
    config = get_plugin_config("terraform-completion"),
    lazy = true,
    ft = "terraform",
  },
  -- }}}
  -- Todo comments {{{
  {
    "folke/todo-comments.nvim",
    lazy = true,
    event = "VeryLazy",
    dependencies = "nvim-lua/plenary.nvim",
    config = get_plugin_config("todo-comments"),
  },
  --}}}
  -- Treesitter + Addons {{{
  {
    "nvim-treesitter/nvim-treesitter",
    config = get_plugin_config("treesitter"),
    build = ":TSUpdate",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
      -- { "nvim-treesitter/nvim-treesitter-textobjects" },
      {
        "m-demare/hlargs.nvim",
        config = get_plugin_config("hlargs"),
        dependencies = { "nvim-treesitter/nvim-treesitter" },
      },
      { "p00f/nvim-ts-rainbow" },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = true,
    event = "VeryLazy",
    config = get_plugin_config("nvim-treesitter-context"),
    dependencies = "nvim-treesitter/nvim-treesitter",
  },
  -- {
  --   "nvim-treesitter/nvim-treesitter-textobjects",
  --   config = get_plugin_config("nvim-treesitter-textobjects"),
  --   dependencies = "nvim-treesitter/nvim-treesitter",
  -- },
  { "nvim-treesitter/playground", lazy = true, cmd = "TSPlaygroundToggle" },
  --}}}
  -- Twilight Highlighting (Zen mode focusing) {{{
  {
    "folke/twilight.nvim",
    config = get_plugin_config("twilight"),
    lazy = true,
    cmd = {
      "Twilight",
      "TwilightEnable",
      "TwilightDisable",
    },
  },
  --}}}
  -- Pandoc integration {{{
  {
    "aspeddro/pandoc.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "jbyuki/nabla.nvim", -- Optional. See Extra Features
    },
    config = get_plugin_config("pandoc"),
  },
  -- }}}
  -- Registers {{{
  { "tversteeg/registers.nvim" },
  -- }}}
  -- Repeat {{{
  { "tpope/vim-repeat" },
  --}}}
  -- Rust {{{
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = {
      "simrat39/inlay-hints.nvim",
    },
    config = get_plugin_config("rust-tools"),
  },
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    dependencies = { { "nvim-lua/plenary.nvim" } },
    config = get_plugin_config("crates"),
  },
  --}}}
  -- Speeddating (Allows incrementing and decrementing of dates) {{{
  { "tpope/vim-speeddating", lazy = true, event = "BufEnter" },
  --}}}
  -- Syntax files {{{
  -- { "sheerun/vim-polyglot" },
  -- }}}
  -- Unimpaired shortcuts {{{
  { "tpope/vim-unimpaired" },
  --}}}
  -- Trailing Whitespace {{{
  -- {
  --   "zakharykaplan/nvim-retrail",
  --   config = get_plugin_config("retrail"),
  -- },
  -- }}}
  -- Zen mode {{{
  {
    "folke/zen-mode.nvim",
    config = get_plugin_config("zen-mode"),
  },
  --}}}
}

local opts = {}
require("lazy").setup(plugins, opts)
