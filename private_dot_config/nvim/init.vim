""""""""""""
" VIM-PLUG "
""""""""""""

call plug#begin('~/.config/nvim/plugged')
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'sirver/ultisnips'
Plug 'jiangmiao/auto-pairs'
Plug 'lfv89/vim-interestingwords'
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
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

"""""""""""""
" FILETYPES "
"""""""""""""

au BufRead,BufNewFile *.source setfiletype sh

""""""""""
" DISLAY "
""""""""""

" Colorscheme
colorscheme molokai

" Always draw the signcolumn.
set signcolumn=yes

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
let g:airline_theme='molokai'

" Airline characters
let g:airline_powerline_fonts = 1

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

"""""""""""""
" ULTISNIPS "
"""""""""""""

let g:UltiSnipsSnippetDirectories = [$HOME.'/.snippets', 'UltiSnips']
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

""""""""""""
" DEOPLETE "
""""""""""""

let g:deoplete#enable_at_startup = 1

""""""""""""""""
" HIGHLIGHTING "
""""""""""""""""

" Syntax highlighting
syntax enable

" Comments in italics
highlight Comment cterm=italic

" Left bar background
highlight clear LineNr
highlight clear SignColumn
