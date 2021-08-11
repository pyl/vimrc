call plug#begin(stdpath('data'))

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
"Plug 'Raimondi/delimitMate'
"Plug 'vim-airline/vim-airline'
Plug 'vim-syntastic/syntastic'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline-themes'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'preservim/nerdcommenter'
Plug 'ervandew/supertab'
Plug 'dbeniamine/cheat.sh-vim'
Plug 'rust-lang/rust.vim'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
call plug#end()

filetype plugin on

let mapleader = "-"
let maplocalleader = "\\"

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

let g:CheatSheetReaderCmd='vnew'
let g:CheatSheetShowCommentsByDefault=0
let g:CheatSheetStayInOrigBuf=0
nnoremap <leader>k :call cheat#cheat("", getcurpos()[1], getcurpos()[1], 0, 0, '!')<CR>
vnoremap <leader>k :call cheat#cheat("", -1, -1, 2, 0, '!')<CR>

" Enable folding
set foldmethod=indent
set foldlevel=99
"Enable folding with the spacebar
nnoremap <space> za

" open files with ctrl-p
nnoremap <c-p> :Files<cr>

au BufNewFile,BufRead *.py,*.java,*.cpp,*.c,*.cs,*.rkt,*.h,*.html
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=120 |
""    \ set expandtab |
""    \ set autoindent |
    \ set fileformat=unix |

set encoding=utf-8

syntax on

" air-line
let g:airline_powerline_fonts = 1
"let g:airline_theme = 'gruvbox'
"let g:airline_theme = 'jellybeans'
let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"highlight Comment cterm=italic gui=italic

set laststatus=2
" set showtabline=2

" true colours
set background=dark
set t_Co=256

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

let ayucolor="light"
"colorscheme onehalflight
colorscheme gruvbox
"colorscheme jellybeans

set hidden
set nu rnu " relative line numbering
set clipboard^=unnamed,unnamedplus " public copy/paste register
set ruler
set showcmd
set noswapfile " doesn't create swap files
set noshowmode
set shortmess+=c
"set omnifunc=syntaxcomplete#Complete
set scrolloff=8

set backspace=indent,eol,start " let backspace delete over lines
set autoindent " enable auto indentation of lines
set smartindent " allow vim to best-effort guess the indentation
set pastetoggle=<leader>p " enable paste mode

set wildmenu "graphical auto complete menu
set lazyredraw "redraws the screne when it needs to
"set showmatch "highlights matching brackets
set incsearch "search as characters are entered
set hlsearch "highlights matching searches


"terminal
tnoremap <Esc> <C-\><C-n>
tnoremap <C-c> <C-\><C-n>

"clears highlights

nnoremap <leader>q :bd!<return>

nnoremap // :noh<return>
" moves current line down or up
nnoremap <leader>- ddp
nnoremap <leader>_ ddkP
" open vimrc in vertical split
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" update changes into current buffer
nnoremap <leader>sv :source $MYVIMRC<cr>
" enable or disable line wrapping in current buffer
nnoremap  <leader>w :set wrap!<cr>
let delimitMate_expand_cr = 1

" c++11 support in syntastic
let g:syntastic_cpp_checkers = ["gcc"]
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++11'
let g:syntastic_rust_checkers = ["rustc"]


" run code
augroup compileandrun
    autocmd!
    autocmd filetype python nnoremap <buffer> <leader>r :w <bar> :vsp <bar> :te python % <cr>
    autocmd filetype cpp nnoremap <buffer> <leader>r :w <bar> !g++ -std=c++11 % <cr> :vnew <bar> :te "a.exe" <cr><cr>
    autocmd filetype cpp nnoremap <buffer> <leader>l :vnew <bar> :te "a.exe" <cr>
    autocmd filetype c nnoremap <buffer> <leader>r :w <bar> !gcc % <cr> :vnew <bar> :te "a.exe" <cr><cr>
    autocmd filetype java nnoremap <buffer> <leader>r :w <bar> !javac % && java %:r <cr>
    autocmd filetype rust nnoremap <buffer> <leader>r :w <bar> !rustc % <cr> :vsp <bar> :te %:r.exe <cr><cr>
augroup END
