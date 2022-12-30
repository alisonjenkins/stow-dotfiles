local ok, pandoc = pcall(require, "pandoc")

if not ok then
	return
end

pandoc.setup()
