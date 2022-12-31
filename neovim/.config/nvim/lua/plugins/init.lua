-- vim: set foldmethod=marker foldlevel=0:
local function get_plugin_config(name) --{{{
	return function()
		require(string.format("plugin-config/%s", name))
	end
end --}}}

return {
	{ "kevinhwang91/nvim-ufo", dependencies = "kevinhwang91/promise-async", config = get_plugin_config("nvim-ufo") },
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
	--   {
	--     "neovim/nvim-lspconfig",
	--     lazy = true,
	--     event = "VeryLazy",
	--     dependencies = {
	--       "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
	--       "folke/neodev.nvim",
	--       -- "hrsh7th/nvim-cmp",
	--       "onsails/lspkind-nvim",
	--       "ray-x/lsp_signature.nvim",
	--       "simrat39/inlay-hints.nvim",
	--       { url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim", config = get_plugin_config("lsp_lines") },
	--       { "rmagatti/goto-preview", config = get_plugin_config("goto-preview") },
	--       { "glepnir/lspsaga.nvim", config = get_plugin_config("lspsaga") },
	--       {
	--         "jose-elias-alvarez/null-ls.nvim",
	--         config = get_plugin_config("null-ls"),
	--         dependencies = { "nvim-lua/plenary.nvim" },
	--       },
	--       { "williamboman/mason.nvim", config = get_plugin_config("mason") },
	--       {
	--         "williamboman/mason-lspconfig.nvim",
	--         config = get_plugin_config("mason-lspconfig"),
	--         dependencies = "williamboman/mason.nvim",
	--       },
	--       { "lukas-reineke/lsp-format.nvim", config = get_plugin_config("lsp-format") },
	--     },
	--     config = get_plugin_config("lspconfig"),
	--   },
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
	--   {
	--     "j-hui/fidget.nvim",
	--     lazy = true,
	--     config = get_plugin_config("fidget"),
	--   },
	--   {
	--     "ray-x/go.nvim",
	--     config = get_plugin_config("go"),
	--     ft = "go",
	--     dependencies = {
	--       "ray-x/guihua.lua",
	--       "rcarriga/nvim-dap-ui",
	--       "theHamsta/nvim-dap-virtual-text",
	--       "williamboman/mason-lspconfig.nvim",
	--     },
	--   },
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
	-- Syntax files {{{
	-- { "sheerun/vim-polyglot" },
	-- }}}
}
