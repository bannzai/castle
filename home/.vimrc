" Global config {
set rtp+=~/.fzf
set incsearch
set hlsearch
set tabstop=2
set shiftwidth=2
set noswapfile
set history=1000
set ttimeoutlen=10
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

filetype on 
colorscheme molokai

let g:mapleader = ' '

" nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>x :Commands<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>k :bd<CR>
nnoremap <C-]> g<C-]>

nmap <C-g><C-g> :Ag 

autocmd BufWritePost * :call AddExecmod()
function! AddExecmod()
  let line = getline(1)
  if strpart(line, 0, 2) == "#!"
    call system("chmod +x ". expand("%"))
  endif
endfunction

highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=22
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=52
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17
highlight DiffText   cterm=bold ctermfg=10 ctermbg=21
" } Global config

" VimPlug {
call plug#begin('~/.vim/plugged')
"
" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" markdown
Plug 'JamshedVesuna/vim-markdown-preview'

" go {
" Use release branch (Recommend)
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" rails
Plug 'scrooloose/syntastic'

" html
Plug 'tpope/vim-surround'

call plug#end()
" } VimPlug 


" matchit {
  if !exists('loaded_matchit')
    runtime macros/matchit.vim
  endif
" } matchit

" Plugin config {
  
  " asynccomplete {
    inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
    " reference: https://qiita.com/hokorobi/items/b4be36253262373fbefc
    let g:asyncomplete_enable_for_all = 1
  " } asynccomplete 

  " Plug 'JamshedVesuna/vim-markdown-preview' {
    let vim_markdown_preview_github=1
    let vim_markdown_preview_browser='Google Chrome'
    let vim_markdown_preview_hotkey='<C-m>'
  " } Plug 'JamshedVesuna/vim-markdown-preview' 
  
" } Plugin config 
