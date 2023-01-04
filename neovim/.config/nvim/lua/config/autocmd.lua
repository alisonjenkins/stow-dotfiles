vim.cmd([[au BufRead *.tf silent! set ft=terraform]])
vim.cmd([[au BufRead *.tfvars silent! set ft=terraform]])
vim.cmd([[au BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 200)]])
vim.cmd([[au TextYankPost * silent! lua vim.highlight.on_yank()]])
