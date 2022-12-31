local ok, luatab = pcall(require, "luatab")

if not ok then
	return
end

luatab.setup({})
