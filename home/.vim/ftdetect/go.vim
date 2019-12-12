let g:go_fmt_command = "goimports"
autocmd FileType go nnoremap <Leader>b :GoBuild<CR>
autocmd FileType go nnoremap <Leader>r :GoRun<CR>
autocmd FileType go nnoremap <Leader>t :GoTest<CR>

nnoremap <leader>n :cnext<CR>
nnoremap <leader>p :cprevious<CR>
nnoremap <leader>c :cclose<CR>
