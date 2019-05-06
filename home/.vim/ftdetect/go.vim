let g:go_fmt_command = "goimports"
autocmd FileType go nnoremap <Leader>b :GoBuild<CR>
autocmd FileType go nnoremap <Leader>r :GoRun<CR>
autocmd FileType go nnoremap <Leader>t :GoTest<CR>
nnoremap <leader>n :cnext<CR>
nnoremap <leader>p :cprevious<CR>
nnoremap <leader>c :cclose<CR>

if executable('go-langserver')
  augroup LspGo
    au!
    au User lsp_setup call lsp#register_server({
        \ 'name': 'go-langserver',
        \ 'cmd': {server_info->['go-langserver', '-gocodecompletion']},
        \ 'whitelist': ['go'],
        \ })
    " omnifunc
    "autocmd FileType go setlocal omnifunc=lsp#complete
    " map
    au FileType go nnoremap <buffer><silent> gd :<C-u>LspDefinition<CR>
    au FileType go nnoremap <buffer><silent> gD :<C-u>LspReferences<CR>
    au FileType go nnoremap <buffer><silent> gs :<C-u>LspDocumentSymbol<CR>
    au FileType go nnoremap <buffer><silent> gS :<C-u>LspWorkspaceSymbol<CR>
    au FileType go nnoremap <buffer><silent> gQ :<C-u>LspDocumentFormat<CR>
    au FileType go vnoremap <buffer><silent> gQ :LspDocumentRangeFormat<CR>
    au FileType go nnoremap <buffer><silent> K :<C-u>LspHover<CR>
    au FileType go nnoremap <buffer><silent> <F1> :<C-u>LspImplementation<CR>
    au FileType go nnoremap <buffer><silent> <F2> :<C-u>LspRename<CR>
  augroup end
endif

