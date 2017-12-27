set nocompatible

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Plugins
call plug#begin('~/.vim/plugged')
"" Autocompletion
Plug 'natebosch/vim-lsc'
"" Auto-completion selection via <Tab>
Plug 'ajh17/VimCompletesMe'
"" ctags / gtags generation
Plug 'ludovicchabant/vim-gutentags'
"" Fuzzy file finder
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
"" Tmux navigator
Plug 'christoomey/vim-tmux-navigator'
"" Solarized color scheme
Plug 'altercation/vim-colors-solarized'
"" Auto-close brackets/quotes/etc.
Plug 'optroot/auto-pairs'
"" vim-surround
Plug 'tpope/vim-surround'
"" newrw improvements
Plug 'tpope/vim-vinegar'
"" Various mappings, such as line bubbling, URL encoding, etc.
Plug 'tpope/vim-unimpaired'
"" Line/block comments
Plug 'scrooloose/nerdcommenter'
"" Asynchronous linting
Plug 'w0rp/ale'
"" Better Python indentation
Plug 'Vimjas/vim-python-pep8-indent'
"" Go development plugin
Plug 'fatih/vim-go'
"" PHP syntax highlighting
Plug 'StanAngeloff/php.vim'
call plug#end()

" Setup for tmux environments
if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

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
set shiftround

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

" Buffer settings
set hidden  " Allow switching to other buffers from an unsaved one

" Search settings
set incsearch
set hlsearch
set ignorecase
set smartcase

" Wild file selection menu
set wildmode=list:longest
set wildmenu
set wildignorecase
set wildignore+=*.o,*.obj,*.pyc,*.pyo,*.jpg,*.jpeg,*.gif,*.png,*/.svn/*,*/.hg/*
set wildignore+=*/.cache/*,*/cache/*

" Line numbering
set number
set relativenumber

" Scroll settings
set ruler
"" Keep X lines above/below the cursor when scrolling
set scrolloff=7
set sidescrolloff=7
set sidescroll=1

" netrw settings
let g:netrw_banner = 0
let g:netrw_winsize = 20
let g:netrw_altv = 1
let g:netrw_sort_options = "i"

" Key bindings
"" Rebind <Leader> key
let mapleader = ','

"" Shortcut to (force) save buffer
nmap <Leader>w :w!<CR>

"" Clear search highlights
noremap <silent><Leader>/ :nohls<CR>

"" Sort selection
vmap s :sort<CR>

"" Switch to previous buffer with backspace
nmap <BS> <C-^>

"" Bubble single line
nmap <C-S-Up> [e
nmap <C-S-Down> ]e
"" Bubble multiple lines
vmap <C-S-Up> [egv
vmap <C-S-Down> ]egv

"" Trigger omnifunc
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-x><C-o>

"" Find usages/definitions of symbol under cursor
nnoremap <leader>css :cstag <C-R>=expand("<cword>")<CR><CR>

" Default to UTF-8 text encoding
set encoding=utf-8
set fileencoding=utf-8

"" Remove trailing whitespace on save
autocmd FileType c,cpp,java,php,python,javascript,html,ruby autocmd BufWritePre <buffer> :call setline(1,map(getline(1 ,"$"),'substitute(v:val,"\\s\\+$","","")'))

" Enable use of ctags tag files for cscope
set cscopetag

" Completion settings
autocmd FileType python :set omnifunc=python3complete#Complete

" Plugin related settings
"" vim-lsc
let g:lsc_server_commands = {'python': 'pyls'}
let g:lsc_enable_autocomplete = v:true
let g:lsc_auto_map = v:true

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

"" auto-pairs
let g:AutoPairsShortcutFastWrap = '<C-e>'
""" Extra settings added in 'optroot' fork
let g:AutoPairsMultilineClose = 0
let g:AutoPairsBalanceImmediately = 1
let g:AutoPairsNeverJumpLines = 1
let g:AutoPairsOnlyBeforeClose = 1

"" vim-go
let g:go_template_autocreate = 0

"" ALE
let g:ale_php_phpmd_ruleset = 'cleancode,codesize,design,controversial,naming,unusedcode'
let g:ale_lint_delay = 1000

"" vim-gutentags
let g:gutentags_ctags_exclude = [".*/*", "build/*"]
