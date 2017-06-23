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

" Plugin related settings
"" nvim-completion-manager
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
""" Use tab to select the popup menu
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"" fzf
nnoremap ` :FZF<cr>
nnoremap <C-P> :Ag<cr>

"" tmux-navigator
""" Window switching, combined with 'stepping'
""" over into tmux panes
nnoremap <silent> <C-Left> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-Down> :TmuxNavigateDown<cr>
nnoremap <silent> <C-Up> :TmuxNavigateUp<cr>
nnoremap <silent> <C-Right> :TmuxNavigateRight<cr>
nnoremap <silent> <C-BS> :TmuxNavigatePrevious<cr>
