local ok, foldpreview = pcall(require, "fold-preview")
if not ok then
	return
end
foldpreview.setup()
