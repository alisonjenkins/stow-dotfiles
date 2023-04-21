local M = {
	"hrsh7th/nvim-cmp",
	lazy = true,
	event = "BufRead",
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
			dependencies = {
				"rafamadriz/friendly-snippets",
			},
		},
		"andersevenrud/cmp-tmux",
		"aspeddro/cmp-pandoc.nvim",
		"f3fora/cmp-spell",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-cmdline",
		{
			"zbirenbaum/copilot-cmp",
			module = "copilot_cmp",
			config = function()
				require("copilot_cmp").setup({
					method = "getCompletionsCycling",
					formatters = {
						label = require("copilot_cmp.format").format_label_text,
						insert_text = require("copilot_cmp.format").format_insert_text,
						preview = require("copilot_cmp.format").deindent,
					},
				})
			end,
		},
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"hrsh7th/cmp-nvim-lsp-document-symbol",
		{ "tzachar/cmp-tabnine", build = "./install.sh" },
		{ "romgrk/fzy-lua-native", build = "make" },
		{ "tzachar/cmp-fuzzy-buffer", dependencies = { "hrsh7th/nvim-cmp", "tzachar/fuzzy.nvim" } },
		{ "jcdickinson/codeium.nvim", config = true },
		{ "jcdickinson/http.nvim", build = "cargo build --workspace --release" },
	},
}

function M.config()
	local ok, cmp = pcall(require, "cmp")
	if not ok then
		return
	end
	local compare = require("cmp.config.compare")
	local lspkind = require("lspkind")

	local source_mapping = {
		nvim_lsp = "[LSP]",
		cmp_tabnine = "[TN]",
		buffer = "[BUF]",
		codium = "[CO]",
		nvim_lua = "[LUA]",
		path = "[PATH]",
	}

	cmp.setup({
		completion = {
			border = "rounded",
			winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
		},
		confirm_opts = {
			border = "rounded",
			select = false,
		},
		window = {
			documentation = cmp.config.window.bordered(),
		},
		experimental = {
			ghost_text = true,
		},
		formatting = {
			format = function(entry, item)
				item.kind = lspkind.presets.default[item.kind]
				local menu = source_mapping[entry.source.name]

				if entry.source.name == "copilot" then
					item.kind = "[] Copilot"
					item.kind_hl_group = "CmpItemKindCopilot"
					return item
				elseif entry.source.name == "cmp_tabnine" then
					if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
						menu = entry.completion_item.data.detail .. " " .. menu
					end
					item.kind = ""
					item.kind_hl_group = "CmpItemKindTabnine"
				elseif entry.source.name == "codeium" then
					item.kind = "^"
				end

				item.menu = menu
				return item
			end,
		},
		mapping = {
			["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i" }),
			["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i" }),
			["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
			["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
			["<C-Space>"] = cmp.mapping(cmp.mapping.complete({}), { "i", "c" }),
			["<C-e>"] = cmp.mapping({
				i = cmp.mapping.abort(),
				c = cmp.mapping.close(),
			}),
			["<C-y>"] = cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Insert,
				select = true,
			}),
		},
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},

		sources = {
			{ name = "copilot", priority = 8 },
			-- { name = "cmp_pandoc",  },
			-- { name = "cmdline" },
			{ name = "crates" },
			-- { name = "orgmode" },
			{ name = "cmp_tabnine", priority = 8 },
			{ name = "nvim_lsp", priority = 8 },
			{ name = "nvim_lsp_signature_help", priority = 8 },
			{ name = "buffer", priority = 7 },
			{ name = "luasnip", priority = 7 },
			{ name = "nvim_lua", priority = 5 },
			{ name = "spell", keyword_length = 3, priority = 5, keyword_pattern = [[\w\+]] },
			{ name = "path", keyword_length = 5 },
			{ name = "fuzzy_buffer", priority = 4 },
			{
				name = "tmux",
				option = {
					all_panes = true,
					label = "[tmux]",
				},
				priority = 4,
			},
		},
		sorting = {
			priority_weight = 1,
			comparators = {
				require("copilot_cmp.comparators").prioritize,
				require("copilot_cmp.comparators").score,
				require("cmp_tabnine.compare"),
				require("cmp_fuzzy_buffer.compare"),
				compare.locality,
				compare.recently_used,
				compare.score,
				compare.offset,
				compare.order,
			},
		},
	})

	-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline("/", {
		sources = {
			{ name = "fuzzy_buffer" },
			{ name = "nvim_lsp_document_symbol" },
		},
	})

	-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline(":", {
		sources = cmp.config.sources({
			-- { name = "fuzzy_path" },
			{ name = "cmdline" },
		}),
	})

	require("cmp_pandoc").setup()
end

return M
