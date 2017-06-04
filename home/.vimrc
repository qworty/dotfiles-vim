set nocompatible

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Plugins
call plug#begin('~/.vim/plugged')
"" Autocompletion
Plug 'roxma/nvim-completion-manager'
if !has('nvim')
    Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'roxma/nvim-cm-tern', {'do': 'npm install'}
call plug#end()

" Tab settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set fo-=t  " don't automatically wrap text when typing

" Make backspace behave as 'usual'
set backspace=indent,eol,start

" Plugin related settings
"" nvim-completion-manager
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
""" Use tab to select the popup menu
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
