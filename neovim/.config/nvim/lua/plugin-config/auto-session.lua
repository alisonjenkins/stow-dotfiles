require("auto-session").setup({
  auto_restore_enabled = false,
  auto_session_suppress_dirs = { "~/" },
  log_level = "info",
})
require("telescope").load_extension("session-lens")
