set nocompatible " Enforces vim, rather than vi

" Set up plugins
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdtree'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'Yggdroot/indentLine'
"Plugin 'lervag/vim-latex'
Plugin 'Shougo/vimproc'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim'}
Plugin 'tpope/vim-fugitive'
Plugin 'klen/python-mode'
Plugin 'joonty/vim-phpqa.git'
Plugin 'Shougo/unite.vim'
Plugin 'm2mdas/phpcomplete-extended'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Raimondi/delimitMate'
Plugin 'flazz/vim-colorschemes'


set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9 "Nicer font for Powerline plugin
set laststatus=2 "Always show status line


filetype plugin indent on

syntax on " Syntax highlighting


set expandtab " Always expand \t to spaces
set tabstop=3 " A \t always counts for three spaces
set shiftwidth=3 " Indent three columns when using shift + >>
set background=dark " dark terminal bg
set number " show line numbers 
set modeline

set autoindent
set smartindent

let g:pymode_rope = 1
" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'
"
" "Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pylint"
" Auto check on save
let g:pymode_lint_write = 1
"
" " Support virtualenv
let g:pymode_virtualenv = 1
"
" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'
"
" " syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
"
" Don't autofold code
let g:pymode_folding = 0


" Highlight trailing whitespace
function ShowSpaces(...)
  let @/='\v(\s+$)|( +\ze\t)'
  let oldhlsearch=&hlsearch
  if !a:0
    let &hlsearch=!&hlsearch
  else
    let &hlsearch=a:1
  end
  return oldhlsearch
endfunction

" Function to trim trailing whitespace
function TrimSpaces() range
  let oldhlsearch=ShowSpaces(1)
  execute a:firstline.",".a:lastline."substitute ///gec"
  let &hlsearch=oldhlsearch
endfunction

command -bar -nargs=? ShowSpaces call ShowSpaces(<args>)
command -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call TrimSpaces()
nnoremap <F12>     :ShowSpaces 1<CR>
nnoremap <S-F12>   m`:TrimSpaces<CR>``
vnoremap <S-F12>   :TrimSpaces<CR>


augroup vimrc_autocmds
autocmd!
autocmd FileType python highlight Excess ctermbg=Black guibg=Black
autocmd FileType python match Excess /\%82v.*/
autocmd FileType python set nowrap
augroup END

set tabstop=3
set shiftwidth=3
let g:NERDTreeDirArrows=0
set mouse=a

" Map ctrl-arrows to move forward and backward a word
map <ESC>[1;5D <C-Left>
map <ESC>[1;5C <C-Right>
map <ESC>[1;5B <C-Down>
map <ESC>[1;5A <C-Up>
map! <ESC>[1;5D <C-Left>
map! <ESC>[1;5C <C-Right>
map! <ESC>[1;5B <C-Down>
map! <ESC>[1;5A <C-Up>
colorscheme hornet
