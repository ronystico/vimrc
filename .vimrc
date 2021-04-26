" Download vimplug if is not present
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" List plugins
call plug#begin('~/.vim/plugged')
" Theme
Plug 'kyoz/purify', { 'rtp': 'vim' }
" Multi cursor
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" Undo changes
Plug 'mbbill/undotree'
" Botnet
Plug 'vbe0201/vimdiscord'
" Coc and some plugins. In Ubuntu, without yarnpkg doesn't do anything
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-html', {'do': 'yarnpkg install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarnpkg install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarnpkg install --frozen-lockfile'}
Plug 'marlonfan/coc-phpls', {'do': 'yarnpkg install --frozen-lockfile'}
Plug 'fannheyward/coc-sql', {'do': 'yarnpkg install --frozen-lockfile'}
" Show css colors inside vim
Plug 'ap/vim-css-color'
" file file file manager
Plug 'preservim/nerdtree'
" Load plugins
call plug#end()

" Open NERDTree
set splitbelow 
autocmd VimEnter * NERDTree
" autocmd VimEnter * UndotreeToggle

" Exit from NERDTree tab at vim start
autocmd VimEnter * wincmd p
" Without this, using :q will result with NERDTree as last tab
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Select coc suggest with <CR> key (enter) and format code
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" god i hate no-upstream distros
set nocompatible

" colorscheme
syntax on " This is required for the colorscheme
colorscheme purify

" open undotree
nnoremap <F3> :NERDTree<CR>
nnoremap <F4> :UndotreeToggle<CR>

" filetype detect
:filetype on

" highlight syntax
syntax on

" show line numbers
set number

" autocomplete parentheses, brackets and braces
  inoremap ( ()<Left>
  inoremap [ []<Left>
  inoremap { {}<Left>

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
