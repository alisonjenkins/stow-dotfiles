local ok, crates = pcall(require, "crates")

if not ok then
	return
end

crates.setup()
