set nocompatible

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Plugins
call plug#begin('~/.vim/plugged')
"" Autocompletion
Plug 'Valloric/YouCompleteMe'
"" Fuzzy file finder
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
"" Tmux navigator
Plug 'christoomey/vim-tmux-navigator'
"" Solarized color scheme
Plug 'altercation/vim-colors-solarized'
call plug#end()

" Syntax highlighting
syntax enable

" Tab settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set fo-=t  " don't automatically wrap text when typing

" Indenting
filetype indent plugin on
set cindent
set smartindent
set autoindent

" Make backspace behave as 'usual'
set backspace=indent,eol,start

" Theme / colors
set t_Co=256
let g:solarized_termcolors=256
set background=light
colorscheme solarized

" Backup settings
set nobackup
set nowb
set noswapfile

" Wild file selection menu
set wildmode=list:longest
set wildmenu
set wildignore+=*.o,*.obj,*.pyc,*.pyo,*.jpg,*.jpeg,*.gif,*.png,*/.svn/*,*/.hg/*
set wildignore+=*/.cache/*,*/cache/*

" Keep X lines above/below the cursor when scrolling
set scrolloff=7
set sidescrolloff=7
set sidescroll=1

" Rebind <Leader> key
let mapleader = ','

" Remove trailing whitespace on save
autocmd FileType c,cpp,java,php,python,javascript,html,ruby autocmd BufWritePre <buffer> :call setline(1,map(getline(1 ,"$"),'substitute(v:val,"\\s\\+$","","")'))

" Plugin related settings
"" nvim-completion-manager
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
""" Use tab to select the popup menu
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"" fzf
nnoremap ` :FZF<CR>
nnoremap <C-P> :Ag<CR>
nnoremap <Leader>b :Buffers<CR>
""" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"" tmux-navigator
""" Window switching, combined with 'stepping'
""" over into tmux panes
nnoremap <silent> <C-Left> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-Down> :TmuxNavigateDown<cr>
nnoremap <silent> <C-Up> :TmuxNavigateUp<cr>
nnoremap <silent> <C-Right> :TmuxNavigateRight<cr>
nnoremap <silent> <C-BS> :TmuxNavigatePrevious<cr>
