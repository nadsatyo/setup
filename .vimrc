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

" Untested__
" Track the engine.
Plugin 'SirVer/ultisnips'
" " Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'


filetype plugin indent on
" End vundle

"Untested__vundle_related__settings
  " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<c-b>"
  let g:UltiSnipsJumpBackwardTrigger="<c-z>"
  " If you want :UltiSnipsEdit to split your window.
  let g:UltiSnipsEditSplit="vertical"
"end

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

" Map key to toggle opt 
function MapToggle(key, opt) 
  let cmd = ':set '.a:opt.'! \| set '.a:opt."?\<CR>" 
  exec 'nnoremap '.a:key.' '.cmd 
  exec 'inoremap '.a:key." \<C-O>".cmd 
endfunction 
command -nargs=+ MapToggle call MapToggle(<f-args>)

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

MapToggle <F8>  number
MapToggle <F9> paste
map <S-F11> :NERDTreeToggle<enter><C-w>h
map <S-F12> :Tlist<enter><C-w>h

set tags=./tags,~/ccts/tags,~/bin/tags/ccts_tags,~/bin/tags/std_tags,~/bin/tags/boost_tags

" Visual Tabbing like textpad: (s-tab doesn't work)
"inoremap <S-Tab> <C-O><LT><LT>
"nnoremap <Tab> >>
"nnoremap <C-Tab> <LT><LT>
"vnoremap <Tab> >gv
"vnoremap <C-Tab> <LT>gv


