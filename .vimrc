" Pathogen Plugin Manager
execute pathogen#infect()

" Syntax Hightlighting and Colors
syntax on
filetype on
au BufNewFile,BufRead *.pyx set filetype=python
set t_Co=256
set background=dark
set wildmenu

" Base16 Color Sheme
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-default-dark
if filereadable(expand("~/.vimrc_background"))
  source ~/.vimrc_background
endif

" Easier Navigation
"nnoremap <c-j> <c-w>j
"nnoremap <c-k> <c-w>k
"nnoremap <c-h> <c-w>h
"nnoremap <c-l> <c-w>l

"nnoremap <c-J> <c-w>r
"nnoremap <c-K> <c-w>R
"nnoremap <c-H> <c-w>H
"nnoremap <c-L> <c-w>L

" i3 integration
nnoremap <silent> <c-l> :call Focus('right', 'l')<CR>
nnoremap <silent> <c-h> :call Focus('left', 'h')<CR>
nnoremap <silent> <c-k> :call Focus('up', 'k')<CR>
nnoremap <silent> <c-j> :call Focus('down', 'j')<CR>

" Latex
nmap <Space>l :w \| !pdflatex %:p <CR>

set mouse=a

" Splits
set splitbelow
set splitright

" Tabs
set expandtab
set autoindent
set shiftwidth=4
set softtabstop=4
set tabstop=8

" Line endings
set colorcolumn=80

" Markdown for Note editor
command Md ! chromium --new-window %

" Relative Line Numbers
:set number relativenumber
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END
set cursorline

" Yank, Paste
:vmap <Space>y "+y
:nmap <Space>p "+p
:vmap <Space>p "+p

