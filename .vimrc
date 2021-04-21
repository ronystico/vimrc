call plug#begin('~/.vim/plugged')
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'nanotech/jellybeans.vim'
Plug 'mbbill/undotree'
Plug 'vbe0201/vimdiscord'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ap/vim-css-color'
Plug 'junegunn/goyo.vim'

call plug#end()

" god i hate no-upstream distros
set nocompatible

" block arrows, the second must have (there is a bug with arrow up)
map <down> <nop>
map <left> <nop>
map <right> <nop>
map <up> <nop>   

imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
imap <up> <nop> 

" colorscheme
:colorscheme jellybeans

" open undotree
nnoremap <F5> :UndotreeToggle<CR>

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
