local ok, incline = pcall(require, "incline")

if not ok then
	return
end

incline.setup()
