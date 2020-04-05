""""""""""""
" VIM-PLUG "
""""""""""""

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'dylanaraps/wal.vim'
Plug 'sirver/ultisnips'
Plug 'jiangmiao/auto-pairs'
call plug#end()

"""""""""""
" GENERAL "
"""""""""""

" Vi improved
set nocompatible

" Enable plugins
filetype plugin on
filetype plugin indent on

" Remap leader
let mapleader=","

" More natural split opening
set splitbelow
set splitright

" Enable mouse
set mouse=a

" Disable swap files
set noswapfile

" Allow hiding buffers
set hid

" Change directory
nnoremap <leader>lcd :lcd %:p:h<CR>:pwd<CR>

"""""""""""""
" FILETYPES "
"""""""""""""

au BufRead,BufNewFile *.source setfiletype sh

""""""""""
" DISLAY "
""""""""""

" Hybrid numbering
set relativenumber number

" Tabs and spaces
set tabstop=4 shiftwidth=4 expandtab

" Intendation
set autoindent

" Display tabs
set list
set listchars=tab:>-

"""""""""""
" AIRLINE "
"""""""""""

" Configuration
let g:airline#extensions#tabline#enabled = 1

" Airline theme
let g:airline_theme='solarized'
let g:airline_solarized_bg='light'

" Airline characters
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 1

" Unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" Powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

"""""""
" FZF "
"""""""

nnoremap <Leader>b :Buffers<cr>
nnoremap <Leader>t :GFiles --exclude-standard --others --cached<cr>
nnoremap <Leader>T :Files<cr>
nnoremap <Leader>l :Lines<cr>
nnoremap <Leader>c :Commits<cr>

" Split key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

"""""""
" WAL "
"""""""

colorscheme wal

"""""""""""""
" ULTISNIPS "
"""""""""""""

let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/mysnippets', 'UltiSnips']
let g:UltiSnipsEditSplit="context"
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
nnoremap <Leader>ue :UltiSnipsEdit<cr>
nnoremap <Leader>ur :call UltiSnips#RefreshSnippets()<cr>

"""""""""""""""""
" FINDING FILES "
"""""""""""""""""

" Tab completion for all file-related tasks
set path+=**

" Display all matching files on tab complete
set wildmenu
set wildmode=list:longest,full

"""""""""""""
" UTILITIES "
"""""""""""""

" Check file in shellcheck:
map <leader>s :!clear && shellcheck -x %<CR>

""""""""""""""""
" HIGHLIGHTING "
""""""""""""""""

" Syntax highlighting
syntax enable

" Comments in italics
highlight Comment cterm=italic
