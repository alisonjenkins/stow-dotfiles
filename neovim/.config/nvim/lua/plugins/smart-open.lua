return {
	"danielfalk/smart-open.nvim",
	branch = "0.1.x",
	config = function()
		require("telescope").load_extension("smart_open")
	end,
	dependencies = { "kkharji/sqlite.lua" },
}
