return {
  'ray-x/navigator.lua',
  requires = {
    { 'ray-x/guihua.lua',     run = 'cd lua/fzy && make' },
    { 'neovim/nvim-lspconfig' },
  },
  config = true,
}
