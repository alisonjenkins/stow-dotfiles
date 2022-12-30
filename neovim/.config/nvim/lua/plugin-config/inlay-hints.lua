local ok, inlay = pcall(require, "inlay-hints")
if not ok then
	return
end

inlay.setup({
  only_current_line = true,

  eol = {
    right_align = true,
  }
})
