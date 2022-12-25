-- vim: set foldmethod=marker foldlevel=0:
local packer_installed, packer = pcall(require, "packer")
local use = packer.use
local is_bootstrap = false

local function bootstrap_packer() --{{{
  local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd("packadd packer.nvim")
  end
end --}}}

local function get_plugin_config(name) --{{{
  return string.format('require("plugin-config/%s")', name)
end --}}}

local function run_plugin_config(name) --{{{
  local file = loadfile(string.format("plugin-config/%s"), name)
  if file ~= nil then
    file()
  end
end --}}}

if not packer_installed then --{{{
  is_bootstrap = true
  bootstrap_packer()
  _, packer = pcall(require, "packer")
end --}}}

packer.init({ --{{{
  display = {
    open_cmd = "leftabove 80vnew [packer]",
    header_sym = "─",
  },
  profile = {
    enable = true,
    threshold = 1,
  },
}) --}}}

packer.startup(function()
  -- Packer self update {{{
  use({ "wbthomason/packer.nvim" }) --}}}
  -- Lua caching {{{
  use({ "lewis6991/impatient.nvim" }) --}}}
  -- Add restoration of last location in files {{{
  use({
    "ethanholz/nvim-lastplace",
    config = get_plugin_config("lastplace"),
  }) --}}}
  -- Alignment {{{
  -- TODO: Configure the mappings for this plugin.
  use({
    "junegunn/vim-easy-align",
  }) --}}}
  -- Ansi Colour Codes {{{
  use({
    "powerman/vim-plugin-AnsiEsc",
  })
  -- }}}
  -- Colour schemes {{{
  use({ "folke/tokyonight.nvim", config = get_plugin_config("tokyonight") })
  use({ "rebelot/kanagawa.nvim", config = get_plugin_config("kanagawa") })
  use({ "sainnhe/everforest", config = get_plugin_config("everforest") })
  --}}}
  -- Commenting {{{
  use({ "numToStr/Comment.nvim", config = get_plugin_config("comment") }) --}}}
  -- Completion {{{
  use({
    "hrsh7th/nvim-cmp",
    config = get_plugin_config("cmp"),
    requires = {
      {
        "L3MON4D3/LuaSnip",
        requires = {
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
      { "tzachar/cmp-tabnine", run = "./install.sh", config = get_plugin_config("tabnine") },
      { "romgrk/fzy-lua-native", run = "make" },
      { "tzachar/cmp-fuzzy-buffer", requires = { "hrsh7th/nvim-cmp", "tzachar/fuzzy.nvim" } },
    },
  }) -- }}}
  -- Colorizer (Colour previews for things that define colours in code) {{{
  use({
    "norcalli/nvim-colorizer.lua",
    event = "BufReadPre",
    config = get_plugin_config("colorizer"),
  }) --}}}
  -- Detect indent {{{
  use({ "tpope/vim-sleuth" })
  -- }}}
  -- Faster filetypes plugin {{{
  use({ "nathom/filetype.nvim" })
  -- }}}
  -- File manager {{{
  use({ "justinmk/vim-dirvish" }) --}}}
  -- Fold previews {{{
  use({
    "anuvyklack/fold-preview.nvim",
    requires = "anuvyklack/keymap-amend.nvim",
    config = get_plugin_config("fold-preview"),
  })
  -- }}}
  -- Folding improvements {{{
  use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async", config = get_plugin_config("nvim-ufo") })
  -- }}}
  -- Fuzzy finding {{{
  use({
    "nvim-telescope/telescope.nvim",
    config = get_plugin_config("telescope"),
    wants = "nvim-web-devicons",
    requires = {
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
      { "nvim-telescope/telescope-fzy-native.nvim", requires = { "romgrk/fzy-lua-native" } },
      { "kyazdani42/nvim-web-devicons", opt = true },
    },
  })
  use({
    "junegunn/fzf",
    run = function()
      vim.fn["fzf#install"]()
    end,
  })
  --}}}
  -- Github Copilot {{{
  -- use({
  --   "zbirenbaum/copilot.lua",
  --   event = { "VimEnter" },
  --   config = function()
  --     vim.defer_fn(function()
  --       require("copilot").setup()
  --     end, 100)
  --   end,
  -- })
  -- }}}
  -- Git integration {{{
  use({
    "tpope/vim-fugitive",
    requires = {
      -- (vimscript) Plugin improve the git commit interface showing diffs to remind you want you are changing.
      "rhysd/committia.vim",
      -- (vimscript) Adds Fugitive Gbrowse support for Gitlab repos.,
      "shumphrey/fugitive-gitlab.vim",
      -- (vimscript) Adds Fugitive Gbrowse support for Bitbucket repos.
      "tommcdo/vim-fubitive",
      -- (vimscript) Adds Fugitive Gbrowse support for GitHub repos.
      "tpope/vim-rhubarb",
    },
  })
  use({
    "mattn/gist-vim",
    wants = "webapi-vim",
    requires = { "mattn/webapi-vim", opt = true },
    cmd = "Gist",
    config = get_plugin_config("gist"),
  })
  use({
    "rhysd/git-messenger.vim",
    cmd = "GitMessenger",
  })
  use({
    "f-person/git-blame.nvim",
    config = get_plugin_config("git-blame"),
  })
  -- use({
  --   "lewis6991/gitsigns.nvim",
  --   config = get_plugin_config("gitsigns"),
  -- })
  use({ "lambdalisue/gina.vim" })
  use({
    "pwntester/octo.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "kyazdani42/nvim-web-devicons",
    },
    config = get_plugin_config("octo"),
  })
  --}}}
  -- Grammar checking {{{
  use({ "rhysd/vim-grammarous", cmd = "GrammarousCheck" })
  --}}}
  -- GPS for statusline (to tell where you are in large structures) {{{
  use({
    "SmiteshP/nvim-gps",
    config = get_plugin_config("gps"),
    requires = "nvim-treesitter/nvim-treesitter",
  }) --}}}
  -- Highlight of use {{{
  use({ "RRethy/vim-illuminate", event = "CursorHold" }) --}}}
  -- Indentation guides {{{
  use({
    "lukas-reineke/indent-blankline.nvim",
    config = get_plugin_config("indent-blankline"),
  })
  -- }}}
  -- Inlay Hints {{{
  use({
    "simrat39/inlay-hints.nvim",
    config = get_plugin_config("inlay-hints"),
  })
  -- }}}
  -- Key mapping {{{
  use({
    "folke/which-key.nvim",
    requires = {
      "aserowy/tmux.nvim",
    },
    event = "VimEnter",
    config = get_plugin_config("which-key"),
  }) --}}}
  -- Language servers + LSP tools {{{
  use({
    "mfussenegger/nvim-dap",
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
  })
  use({
    "neovim/nvim-lspconfig",
    requires = {
      "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
      "folke/neodev.nvim",
      "hrsh7th/nvim-cmp",
      "onsails/lspkind-nvim",
      "ray-x/lsp_signature.nvim",
      "simrat39/inlay-hints.nvim",
      {
        "ray-x/go.nvim",
        config = get_plugin_config("go"),
        requires = {
          "ray-x/guihua.lua",
          "rcarriga/nvim-dap-ui",
          "theHamsta/nvim-dap-virtual-text",
        },
      },
      { "https://git.sr.ht/~whynothugo/lsp_lines.nvim", config = get_plugin_config("lsp_lines") },
      { "rmagatti/goto-preview", config = get_plugin_config("goto-preview") },
      { "glepnir/lspsaga.nvim", config = get_plugin_config("lspsaga") },
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = get_plugin_config("null-ls"),
        requires = { "nvim-lua/plenary.nvim" },
      },
      { "williamboman/mason.nvim", config = get_plugin_config("mason") },
      { "williamboman/mason-lspconfig.nvim", config = get_plugin_config("mason-lspconfig") },
      { "lukas-reineke/lsp-format.nvim", config = get_plugin_config("lsp-format") },
    },
    config = get_plugin_config("lspconfig"),
  })
  use({
    "folke/lsp-trouble.nvim",
    wants = { "nvim-web-devicons", "nvim-lspconfig" },
    requires = { "kyazdani42/nvim-web-devicons" },
    config = get_plugin_config("trouble"),
  })
  use({
    "j-hui/fidget.nvim",
    config = get_plugin_config("fidget"),
  })
  --}}}
  -- Markdown previews{{{
  use({
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = { "markdown" },
    config = get_plugin_config("markdown-preview"),
  }) --}}}
  -- Mini modules {{{
  use({
    "echasnovski/mini.nvim",
    config = get_plugin_config("mini"),
  })
  -- }}}
  -- Neorg (Neovim Org mode) {{{
  use({
    "nvim-neorg/neorg",
    run = ":Neorg sync-parsers",
    config = get_plugin_config("neorg"),
    requires = "nvim-lua/plenary.nvim",
  })
  -- }}}
  -- nvim-dev-webicons {{{
  use({
    "kyazdani42/nvim-web-devicons",
    config = get_plugin_config("nvim-web-devicons"),
  }) --}}}
  -- Per project marks {{{
  use({
    "ThePrimeagen/harpoon",
    requires = { "nvim-lua/plenary.nvim" },
  }) --}}}
  -- Vim Rest Console {{{
  use({
    "diepm/vim-rest-console",
  })
  -- }}}
  -- Per split buffer names {{{
  use({ "b0o/incline.nvim", config = get_plugin_config("incline") })
  -- }}}
  -- Search index overlay {{{
  use({
    "kevinhwang91/nvim-hlslens",
    config = get_plugin_config("nvim-hlslens"),
    requires = { "nvim-lua/plenary.nvim" },
  })
  -- }}}
  -- Smooth scrolling {{{
  use({
    "karb94/neoscroll.nvim",
    keys = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-e>", "zt", "zz", "zb" },
    config = get_plugin_config("neoscroll"),
  }) --}}}
  -- Statusline {{{
  use({
    "nvim-lualine/lualine.nvim",
    requires = {
      "SmiteshP/nvim-gps",
    },
    config = get_plugin_config("lualine"),
  }) --}}}
  -- Tabline {{{
  use({
    "alvarosevilla95/luatab.nvim",
    config = get_plugin_config("luatab"),
    requires = { "kyazdani42/nvim-web-devicons" },
  })
  -- }}}
  -- Terraform Plugins {{{
  use({
    "hashivim/vim-terraform",
    config = get_plugin_config("terraform"),
    requires = "godlygeek/tabular",
  })
  use({
    "alanjjenkins/vim-terraform-completion",
    config = get_plugin_config("terraform-completion"),
  })
  -- }}}
  -- Todo comments {{{
  use({
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = get_plugin_config("todo-comments"),
  }) --}}}
  -- Treesitter + Addons {{{
  use({
    "nvim-treesitter/nvim-treesitter",
    config = get_plugin_config("treesitter"),
    run = ":TSUpdate",
    requires = {
      -- { "nvim-treesitter/nvim-treesitter-textobjects" },
      {
        "m-demare/hlargs.nvim",
        config = get_plugin_config("hlargs"),
        requires = { "nvim-treesitter/nvim-treesitter" },
      },
      { "p00f/nvim-ts-rainbow", opt = true },
    },
    wants = {
      "nvim-ts-rainbow",
    },
  })
  use({ "nvim-treesitter/nvim-treesitter-context", config = get_plugin_config("nvim-treesitter-context") })
  use({ "nvim-treesitter/playground" })
  -- use({ "nvim-treesitter/nvim-treesitter-textobjects", config = get_plugin_config("nvim-treesitter-textobjects") })
  --}}}
  -- Twilight Highlighting (Zen mode focusing) {{{
  use({
    "folke/twilight.nvim",
    config = get_plugin_config("twilight"),
  })
  --}}}
  -- Pandoc integration {{{
  use({
    "aspeddro/pandoc.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "jbyuki/nabla.nvim", -- Optional. See Extra Features
    },
    config = get_plugin_config("pandoc"),
  })
  -- }}}
  -- Registers {{{
  use({ "tversteeg/registers.nvim" })
  -- }}}
  -- Repeat {{{
  use({ "tpope/vim-repeat" })
  --}}}
  -- Rust {{{
  use({
    "simrat39/rust-tools.nvim",
    requires = {
      "simrat39/inlay-hints.nvim",
    },
    config = get_plugin_config("rust-tools"),
  })
  use({
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    requires = { { "nvim-lua/plenary.nvim" } },
    config = get_plugin_config("crates"),
  })
  --}}}
  -- Startup Dashboard {{{
  use({
    "goolord/alpha-nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
    wants = "nvim-web-devicons",
    config = function()
      require("alpha").setup(require("alpha.themes.startify").opts)
    end,
  }) --}}}
  -- Speeddating (Allows incrementing and decrementing of dates) {{{
  use({
    "tpope/vim-speeddating",
  }) --}}}
  -- Tmux integration {{{
  use({
    "aserowy/tmux.nvim",
    config = get_plugin_config("tmux"),
  }) --}}}
  -- Syntax files {{{
  use({ "sheerun/vim-polyglot" })
  -- }}}
  -- Unimpaired shortcuts {{{
  use({ "tpope/vim-unimpaired" }) --}}}
  -- Trailing Whitespace {{{
  -- use({
  --   "zakharykaplan/nvim-retrail",
  --   config = get_plugin_config("retrail"),
  -- })
  -- }}}
  -- Zen mode {{{
  use({
    "folke/zen-mode.nvim",
    config = get_plugin_config("zen-mode"),
  }) --}}}

  if is_bootstrap then
    require("packer").sync()
  end

  -- TODO: Configure Packer's compiled code to be cached by Lua cache
  -- TODO: Setup more lazy loading for packer
  -- TODO: Consider switching from Lightspeed to hop or get rid of both...
  -- TODO: Setup Java plugin
end)
