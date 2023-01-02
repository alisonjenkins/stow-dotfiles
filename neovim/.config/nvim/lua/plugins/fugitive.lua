local M = {
  "tpope/vim-fugitive",
  lazy = true,
  cmd = {
    "GBrowse",
    "GDelete",
    "GMove",
    "GRename",
    "Gdiffsplit",
    "Gedit",
    "Ggrep",
    "Git",
    "Glgrep",
    "Gread",
    "Gvdiffsplit",
    "Gwrite",
  },
  dependencies = {
    -- (vimscript) Plugin improve the git commit interface showing diffs to remind you want you are changing.
    "rhysd/committia.vim",
    -- (vimscript) Adds Fugitive Gbrowse support for Gitlab repos.,
    "shumphrey/fugitive-gitlab.vim",
    -- (vimscript) Adds Fugitive Gbrowse support for Bitbucket repos.
    "tommcdo/vim-fubitive",
    -- (vimscript) Adds Fugitive Gbrowse support for GitHub repos.
    "tpope/vim-rhubarb",
  },
}

return M
