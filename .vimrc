" make sure I have the vimplug
" download vimplug if is not present
if has('win32') || has('win64')
    " windows is trash / for bill gates: windows the best os
else
    let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
    if empty(glob(data_dir . '/autoload/plug.vim'))
        silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
endif

" list and start plugins
" List plugins based on operating system
if has('win32') || has('win64')
    call plug#begin('$HOME/vimfiles/plugged')
else
    call plug#begin('~/.vim/plugged')
endif
" icons, you need nerdfonts, I use fura code nerd font (yes, fura) (i wanna be
" cool too)
Plug 'ryanoasis/vim-devicons'
" the colorscheme (suggest another)
Plug 'wojciechkepka/vim-github-dark'
" Undo changes
Plug 'mbbill/undotree'
" vim backdoor
Plug 'vimsence/vimsence'
" Coc and some plugins. In Ubuntu, without yarnpkg doesn't do anything
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-html', {'do': 'yarnpkg install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarnpkg install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarnpkg install --frozen-lockfile'}
Plug 'marlonfan/coc-phpls', {'do': 'yarnpkg install --frozen-lockfile'}
Plug 'fannheyward/coc-sql', {'do': 'yarnpkg install --frozen-lockfile'}
" Show css colors inside vim
Plug 'ap/vim-css-color'
" html like ninja
Plug 'mattn/emmet-vim'
" file file file manager
Plug 'preservim/nerdtree'
" autopairs some things like () [] I don't know, I like bloat
Plug 'jiangmiao/auto-pairs'
" the fugitive, he is the last because he is escaping (jokes apart, git inside vim)
Plug 'tpope/vim-fugitive'
" the vim bar that I see in screenshots, I wanna be cool too
Plug 'itchyny/lightline.vim'
" Load plugins
call plug#end()

" automatic things
" GUI font (gVIm)
if has("gui_running")
    if has("gui_gtk2")
        set guifont=FuraMono\ NF\ 12
    elseif has("gui_win32")
        set guifont=FuraMono_NF:h12
    endif
endif
" Open NERDTree
autocmd VimEnter * NERDTree
" Exit from NERDTree tab at vim start
autocmd VimEnter * wincmd p
" Without this, using :q will result with NERDTree as last tab
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Select coc suggest with <CR> key (enter) and format code
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" plugins needed things (The other ones are not here)
" For icons (encoding)
set encoding=UTF-8

" setting colorscheme
colorscheme ghdark
" lightline (hmmm no idea)
let g:lightline = {
      \ 'colorscheme': 'ghdark',
      \ }

" personal things
" mapping keys
nnoremap <F1> :NERDTree<CR>
nnoremap <F2> :UndotreeToggle<CR>
" vi > vim
set nocompatible
" highlight syntax
syntax on
" filetype detect
filetype on
" after hours reading about tab vs spaces war...
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
" show line number
set number
" to permit multitab. it simply shut up vim when switching from an unsaved file
set hidden
" show matching brackets
set showmatch
" dark > light 
set background=dark
" wrap text
set wrap
" show cursor line and column
set ruler
" show mode
set showmode
" the most controvertial change. please open a bug report to discuss this.
set mouse=a
