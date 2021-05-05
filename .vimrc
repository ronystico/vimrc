" make sure I have the vimplug
" download vimplug if is not present
if has('win32') || has('win64')
    " no windows
else
    let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
    if empty(glob(data_dir . '/autoload/plug.vim'))
        silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
endif

" list and start plugins
" List plugins
if has('win32') || has('win64')
    call plug#begin('$HOME/vimfiles/plugged')
else
    call plug#begin('~/.vim/plugged')
endif
" debelopersebas icons, you need nerdfonts, I use fura code nerd font (yes, fura)
Plug 'ryanoasis/vim-devicons'
" the colorscheme
Plug  'joshdick/onedark.vim'
" Undo changes
Plug 'mbbill/undotree'
" Botnet
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
" GUI font
if has("gui_running")
    if has("gui_gtk2")
        set guifont=FuraMono\ NF\ 12
    elseif has("gui_win32")
        set guifont=FuraMono_NF:h12
    endif
endif
" Open NERDTree
autocmd VimEnter * NERDTree
"" let g:NERDTreeNodeDelimiter = "\u00a0" ///////////////////////
" Exit from NERDTree tab at vim start
autocmd VimEnter * wincmd p
" Without this, using :q will result with NERDTree as last tab
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Select coc suggest with <CR> key (enter) and format code
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" plugins needed things (I think the other ones are not here)
" For debelopersebas icons
set encoding=UTF-8

" colorscheme
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
    if (has("nvim"))
        "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
    "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
    " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
    if (has("termguicolors"))
        set termguicolors
    endif
endif
colorscheme onedark
" lightline
let g:lightline = {
            \ 'colorscheme': 'onedark',
            \ }

" personal things
" mapping keys
nnoremap <F1> :NERDTree<CR>
nnoremap <F2> :UndotreeToggle<CR>
" god i hate no-upstream distros
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
