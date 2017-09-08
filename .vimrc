"--------------------------------------------------
" .vimrc
"-------------------------------------------------- 


" Start vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdtree.git'
Plugin 'Buffergator'
Plugin 'taglist.vim'
Plugin 'ctrlpvim/ctrlp.vim'

filetype plugin indent on
" End vundle

set vb
set noerrorbells
set autoindent
set backspace=indent,eol,start
syntax enable
set ts=2
set sw=2
set textwidth=0
set et 

set hlsearch

"--------------------------------------------------
" GVim Specific Settings
"-------------------------------------------------- 
if has("gui_running")
	set guifont=Courier\ 10 
	colorscheme morning

	set nowrap
	set guioptions+=b
endif
"--

"--------------------------------------------------
" Mappings
"-------------------------------------------------- 

"" OMNICPPCOMPLETE
set nocp
filetype plugin on

" Appease my fat fingers 
command! -nargs=0 W exec 'write'

" Map key to toggle opt 
function MapToggle(key, opt) 
  let cmd = ':set '.a:opt.'! \| set '.a:opt."?\<CR>" 
  exec 'nnoremap '.a:key.' '.cmd 
  exec 'inoremap '.a:key." \<C-O>".cmd 
endfunction 
command -nargs=+ MapToggle call MapToggle(<f-args>)


MapToggle <S-F11> paste
MapToggle <F8>  number

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Run gnumake
map <F9> :w<ENTER>:make optimize=0<ENTER>

" Toggle tag list
map <S-F12> :Tlist<enter><C-w>h


" Visual Tabbing like textpad: (s-tab doesn't work)
inoremap <S-Tab> <C-O><LT><LT>
nnoremap <Tab> >>
nnoremap <C-Tab> <LT><LT>
vnoremap <Tab> >gv
vnoremap <C-Tab> <LT>gv

set tags=./tags,~/ccts/tags,~/bin/tags/ccts_tags,~/bin/tags/std_tags,~/bin/tags/boost_tags

set ts=2
set sw=2
