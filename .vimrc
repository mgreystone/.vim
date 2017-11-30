" ~/.vimrc
"



" no vi compat
set nocompatible

" filetype func off
filetype off

" initialize vundle
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" start- all plugins below

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree.git'

" stop - all plugins above
call vundle#end()

" filetype func on
filetype plugin indent on

" set color
"colorscheme gruvbox
"set background=dark
"set colorcolumn

" NERDTree shortcut
map <C-n> :NERDTreeToggle<CR>

"set shortmess=a
"set cmdheight=2
"silent !echo Hello
