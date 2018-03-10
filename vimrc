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
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-commentary'
Plugin 'dracula/vim'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'mxw/vim-jsx'
Plugin 'othree/javascript-libraries-syntax.vim'
" Plugin 'marijnh/tern_for_vim'
Plugin 'vim-scripts/JavaScript-Indent'
Plugin 'w0rp/ale'
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'elzr/vim-json'
Plugin 'othree/jspc.vim'
Plugin 'tpope/vim-surround'
Plugin 'ryanoasis/vim-devicons'
Plugin 'nathanaelkane/vim-indent-guides'

" stop - all plugins above
call vundle#end()

" filetype func on
filetype plugin indent on

" font
set guifont=FiraCode\ Nerd\ Font\ 11
" set guifont=Fira_Code:h15

" set color
syntax on
set t_Co=256
set termguicolors
colorscheme dracula
let g:dracula_italic = 1
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
" Override some dracula defaults that I don't like
hi Comment ctermfg=61 ctermbg=NONE cterm=italic guifg=#6272a4 guibg=NONE gui=italic
hi ErrorMsg ctermfg=16 ctermbg=141 cterm=NONE guifg=#282a36 guibg=#BD93F9 gui=NONE
hi WarningMsg ctermfg=16 ctermbg=141 cterm=NONE guifg=#282a36 guibg=#BD93F9 gui=NONE

" Indentation Guides
let g:indent_guides_enable_on_vim_startup = 1

" AIRLINE CONFIG
let g:airline_theme='dracula'
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
" let g:airline_left_sep=''
" let g:airline_right_sep=''

 
" NERDTree shortcut
map <F1> :NERDTreeToggle<CR>
" Show dot files (ie. .vimrc)
let NERDTreeShowHidden=1
let NERDTreeIgnore=['.DS_Store', '.git']
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" Auto Open NERDTree when vim is opened with no args or when file opened is a
" directory. Else only open file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" Close vim if only NERDTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDTree Syntax Highlighting
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

" autocmd StdinReadPre " Vim Multi Cursors Key Bindings
let g:multi_cursor_use_default_mapping=0

let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

filetype plugin indent on

set tabstop=2     " show existing tab with 2 spaces width
set shiftwidth=2  " when indenting with '>', use 2 spaces width
set expandtab     " On pressing tab, insert 2 spaces
set autoindent    " Enable auto-indent
set smarttab      " Tab smarter
set number        " Show line numbers
set smartindent   " C-like autoindenting when starting a new line
set mouse=a       " Enable mouse
set noswapfile    " Disables making temporary backup files (.swp)
set scrolloff=15  " Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1  " Auto resize Vim splits to active split
set backspace=indent,eol,start  " Make backspace key work as expected
set incsearch     " Show pattern matches as search is typed
set laststatus=2     " Always show a status line
set encoding=utf-8   " Use Utf-8
set hlsearch        " Highlight previous search pattern
set ignorecase      " Ignore case in search pattern
set smartcase       " ^ But be smart about it
set noshowmode


" ALE CONIGURATIONS
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'javascript.jsx': ['eslint'],
\   'json': ['eslint'],
\   'css': ['stylelint'],
\   'scss': ['stylelint']
\}
let g:ale_fixers = { 
\   'javascript': ['prettier', 'eslint'],
\   'css': ['prettier', 'stylelint'],
\   'scss': ['prettier', 'stylelint'],
\   'json': ['prettier'],
\   'markdown': ['prettier']
\}

let g:ale_javascript_prettier_use_local_config = 1

let g:ale_sign_column_always = 1
" let g:ale_sign_warning = '>>'
" Comment these 2 lines out if your terminal doesn't support emojis
let g:ale_sign_warning = '⚠️'
let g:ale_sign_error = '⛔️'
highlight ALEError ctermbg=none cterm=underline
highlight ALEWarning ctermbg=none cterm=underline
" highlight ALEErrorSign guibg='#823838'
" highlight ALEErrorSign guibg='#810000'
highlight clear ALEErrorSign
highlight clear ALEWarningSign
highlight ALEWarningSign guifg='#F1FA8C'
let g:ale_fix_on_save = 1
map <C-P>  :ALEFix <CR>

" clears vims search highlight with esc
nnoremap  <silent> <F2> :noh<cr>
noh

" Easier Split Navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" more natural splits
set splitbelow
set splitright

" my javascript libraries
let g:used_javascript_libs = 'angularjs,react,jquery,underscore,angularuirouter,flux,requirejs,jasmine,chai,d3'

" vim-jsx - allow syntax highlighting in .js files
let g:jsx_ext_required = 0

" set system clipboard as the default register
set clipboard+=unnamedplus

set guicursor=n:blinkon1
highlight Comment cterm=italic
