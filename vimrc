set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set encoding=utf-8
set number
set nowrap
set smartindent
set wildmenu
set wildmode=list:full
set laststatus=2
"set statusline=%f%m%=%y[%{&fileencoding}][%{&fileformat}]
set showtabline=2
set colorcolumn=80
set ignorecase
set smartcase
set incsearch
set list
set listchars=tab:>-,trail:-
set autoread
set noswapfile
set nobackup
set showcmd
set hlsearch
set grepprg=internal
set encoding=utf-8

:syntax enable
":set background=dark
":colorscheme solarized
":colorscheme ChocolateLiquor
":colorscheme desert

if $COLORTERM == 'gnome-terminal'
  set term=gnome-256color
  colorscheme railscasts
else
  "colorscheme default
  colorscheme ChocolateLiquor
endif

"" Vundle config
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'Shougo/unite.vim'
Bundle 'thinca/vim-ref'
Bundle 'thinca/vim-quickrun'
Bundle 'project.tar.gz'
Bundle 'tsaleh/vim-align'
Bundle 'tpope/vim-fugitive'
Bundle 'surround.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'thinca/vim-quickrun'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rails'
Bundle 'scrooloose/nerdcommenter'
"Bundle 'Shougo/git-vim'

"" vim-ref config
let g:ref_phpmanual_path = $HOME . '/work/PHP_manual/php-chunked-xhtml/'
let $PATH = $PATH . ':/usr/bin/'
let g:ref_phpmanual_cmd  = 'w3m -dump %s'

"omni completion enabled
:setlocal omnifunc=syntaxcomplete#Complete
:filetype plugin on
:filetype indent on
:set tabstop=2
:set softtabstop=2
:set shiftwidth=2
:set expandtab

"PHP dictionary for completion
:set dictionary=~/.vim/dict/php.dict
"use different dictionary according to the file extension
autocmd FileType php :set dictionary=~/.vim/dict/php.dict

function InsertTabWrapper()
if pumvisible()
  return "\<c-n>"
endif
let col = col('.') - 1
if !col || getline('.')[col - 1] !~ '\k\|<\|/'
  return "\<tab>"
elseif exists('&omnifunc') && &omnifunc == ''
  return "\<c-n>"
else
  return "\<c-x>\<c-o>"
endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

:set makeprg=php\ -l\ %
:set errorformat=%m\ in\ %f\ on\ line\ %l
:source /usr/share/vim/addons/plugin/matchit.vim
:let b:match_words = "if:endif,(:),{:},[:]"

"PHP関連
let php_sql_query=1
let php_htmlInStrings=1
"let php_noShortTags=1
let php_folding=1
