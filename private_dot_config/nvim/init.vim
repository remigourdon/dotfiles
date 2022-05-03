""""""""""""
" VIM-PLUG "
""""""""""""

call plug#begin('~/.config/nvim/plugged')
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'lfv89/vim-interestingwords'
Plug 'airblade/vim-gitgutter'
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dag/vim-fish'
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

" Autowrite
set autowrite
set autowriteall

"""""""""""""
" FILETYPES "
"""""""""""""

au BufRead,BufNewFile *.source setfiletype sh
au BufRead,BufNewFile *.mjs setfiletype javascript

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

" Enable true color
set termguicolors

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

"""""""""""
" VIMWIKI "
"""""""""""

let wiki_public = {}
let wiki_public.path = '~/Projects/wiki-public/'
let wiki_public.syntax = 'markdown'
let wiki_public.ext = '.md'

let wiki_personal = {}
let wiki_personal.path = '~/Documents/wiki-personal/'
let wiki_personal.syntax = 'markdown'
let wiki_personal.ext = '.md'

let wiki_work = {}
let wiki_work.path = '~/Projects/wiki-work/'
let wiki_work.syntax = 'markdown'
let wiki_work.ext = '.md'

let g:vimwiki_list = [wiki_public, wiki_personal, wiki_work]

let g:vimwiki_global_ext = 0

"""""""
" COC "
"""""""

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use gh to show documentation in preview window.
nnoremap <silent> gh :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

""""""""""""
" SNIPPETS "
""""""""""""

" Use <C-j> for both expand and jump (make expand higher priority)
imap <C-j> <Plug>(coc-snippets-expand-jump)

nnoremap <Leader>ue :CocCommand snippets.editSnippets<cr>

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

" Left bar background
highlight clear LineNr
highlight clear SignColumn

""""""""""""
" AUTOCMDS "
""""""""""""

" Remove trailing whitespace on save
autocmd BufWritePre *.py :%s/\s\+$//e

" Always write when losing focus
:au FocusLost * :wa

" Run chezmoi apply automatically
autocmd BufWritePost ~/.local/share/chezmoi/* ! chezmoi apply --source-path "%"
