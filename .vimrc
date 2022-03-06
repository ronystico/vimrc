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
" icons
Plug 'ryanoasis/vim-devicons'
" colorscheme
Plug 'arcticicestudio/nord-vim'
" TABS
Plug 'bagrat/vim-buffet'
" Undo changes
Plug 'mbbill/undotree'
" Typescript
Plug 'leafgarland/typescript-vim'
" Cuc 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" fzf loves vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" forgive me, :bdelete
Plug 'moll/vim-bbye'
" Show css colors inside vim
Plug 'ap/vim-css-color'
" fzf > NERDTree
Plug 'preservim/nerdtree'
" autopair some things like () [] I don't know, I like bloat
Plug 'jiangmiao/auto-pairs'
" close HTML tags like a PRO
Plug 'alvan/vim-closetag'
" the vim bar that I see in screenshots, I want to be cool too
Plug 'itchyny/lightline.vim'
" git inside vim
Plug 'tpope/vim-fugitive'
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

" NERDTree
" Open NERDTree (replaced by fzf)
"autocmd VimEnter * NERDTree
" Exit from NERDTree tab at vim start
"autocmd VimEnter * wincmd p
" Without this, using :q will result with NERDTree as last tab
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" COC 
" navigate completion list with <tab>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" Select coc suggest with <CR> key (enter)
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" install if no present
let g:coc_global_extensions = ['coc-html','coc-css','coc-eslint','coc-json','coc-tsserver','coc-angular','coc-rust-analyzer','coc-omnisharp','coc-git','coc-emmet','coc-prettier','coc-spell-checker','coc-discord','coc-snippets']
" code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Some servers have issues with backup files
set nobackup
set nowritebackup
" Use <C-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <C-space> coc#refresh()
else
  inoremap <silent><expr> <C-@> coc#refresh()
endif
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" cuc, please format all my files. let me configure here lol
" let g:coc_preferences_formatOnType = true
" let g:coc_preferences_formatOnSaveFiletypes =  ["*"]
" time to take the prettierpill (not yet)
" let g:prettier_formatterPriority = 1000
" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" plugins needed things (The other ones are not here)
" The UTF Revolution and its consequences have been a disaster for the human race. 
set encoding=UTF-8

" vim-buffet
noremap <S-Tab> :bn<CR>
noremap <C-t> :tabnew split<CR>
let g:buffet_show_index = 1
set termguicolors

" theming
" setting colorscheme
colorscheme nord 
" lightline (hmmm no idea)
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'enable' : {
      \ 'tabline' : 0
      \  }
      \ }
" lightline, please don't override vim-buffet
let g:lightline.enable.tabline = 0
      
" personal things
" mapping keys
nnoremap <F1> :NERDTree<CR>
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F3> :UndotreeToggle<CR>
" close current buffer
nnoremap <leader>q :Bdelete<CR>
" close all buffers
nnoremap <leader>qq :bufdo :Bdelete<CR>
" open FZF
nnoremap <C-p> :Files <CR>
" FZF variable
let $FZF_DEFAULT_COMMAND='find . \( -name node_modules -o -name .git -o -name bin -o -name obj -o -name .log \) -prune -o -print'
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
" light> dark
set background=dark
" wrap text
set wrap
" show cursor line and column
set ruler
" show mode
set showmode
" the most controversial change. please open an issue report to discuss this
set mouse=a
