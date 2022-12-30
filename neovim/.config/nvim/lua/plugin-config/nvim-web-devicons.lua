local ok, devicons = pcall(require,"nvim-web-devicons")

if not ok then
	return
end

devicons.setup {
  -- globally enable default icons (default to false)
  -- will get overriden by `get_icons` option
  default = true,
}
