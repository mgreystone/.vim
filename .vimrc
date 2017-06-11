" Type :so % to refresh .vimrc after making changes

" Use Vim settings, rather then Vi settings
set nocompatible

" Leader - ( Spacebar )
let mapleader = " "

execute pathogen#infect()
call pathogen#helptags()

"""
""" Syntax Highlighting and Appearance
"""
syntax on
filetype plugin indent on

set background=dark
colorscheme quantum

let g:used_javascript_libs = 'angularjs,react,jquery,underscore,angularuirouter,flux,requirejs,jasmine,chai,d3'

let g:WebDevIconsOS = 'Darwin'
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''

" Macvim only
hi NonText guifg=bg

" vim-jsx - allow syntax highlighting in .js files
let g:jsx_ext_required = 0

"""
""" Configuration
"""
set path=$PWD/**
set number        " Shows line numbers
set tabstop=2     " Sets tabs to be two spaces
set shiftwidth=2  " Sets how many columns are indented when you re-indent
set expandtab     " Expand tabs into spaces
set autoindent    " Enable auto-indent
set smartindent   " C-like autoindenting when starting a new line
set mouse=a       " Enable mouse
set noswapfile    " Disables making temporary backup files (.swp)
set autowrite     " Automatically :write before running commands
set autoread      " Reload files changed outside vim
set scrolloff=8   " Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1  " Auto resize Vim splits to active split
set wildmenu        " Command line completion enhanced
set wildignore+=**/node_modules/**
set wildignore+=**/bower_components/**
set wildignore+=**/dump/**
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
" set matchpairs+=<:> " Match <> for HTML editing
set backspace=indent,eol,start  " Make backspace key work as expected
set complete-=i   " Remove included files from auto completion
set showmatch     " Brief visual feedback when you match a pair (ex. parentheses)
set noshowmode    " Hide mode at bottom of the screen (since I use airline)
set smarttab      " Tab smarter
set nrformats-=octal " Remove octals when using C-a or C-x
set shiftround       " Rounds indent to multiple of shiftwidth
set ttimeout         " Timeout to wait for compound commands
set ttimeoutlen=50   " Sets timeout length for timeout commands
set incsearch        " Show pattern matches as search is typed
set laststatus=2     " Always show a status line
set ruler            " Show line and col number of cursor
set showcmd          " Shows partial command in the last line
set encoding=utf-8   " Natch
set list             " Show whitespace characters
set listchars=tab:▒░,trail:▓
set hlsearch        " Highlight previous search pattern
set ignorecase      " Ignore case in search pattern
set smartcase       " ^ But be smart about it
set hidden          " Allows switching buffers without saving changes
set nobackup        " Don't create backup files - live on the wild side
set nowritebackup   " Changes the save behavior of vim to write directly to buffer - danger is my middle name
set fileformats=unix,dos,mac            " Used of EOL formats
set completeopt=menuone,longest,preview " Options for insert mode completion
set completeopt-=preview                " tern_for_vim - turn off the preview window
set guioptions-=r   " Remove right-hand scrollbar
set guioptions-=L   " Remove left-hand scrollbar

" Personal hotkeys
inoremap jk <esc>
nnoremap <leader>; A;<esc>
nnoremap <leader>, A,<esc>
nnoremap <leader>n :noh<cr>
nnoremap <leader>e :redraw!<cr>
nnoremap <leader>w :%s/\s\+$//e<cr>
" rip into the next line (ex. split up a pair of <div></div>)
nnoremap <leader>r a<CR><esc><S-o><tab>
nnoremap <leader>t :SyntasticToggle<cr>
nnoremap <leader>c :SyntasticCheck<cr>
" move to beginning and end of line with H and L
" and move quicker with J and K (except in normal mode)
nnoremap H \|
nnoremap L $
"nnoremap J 4j
nnoremap K 4k
vnoremap H \|
vnoremap L $
vnoremap J 4j
vnoremap K 4k
onoremap H \|
onoremap L $
onoremap J 4j
onoremap K 4k
" delete to end of line
nnoremap <C-k> d$
" easier to go back in searches
nnoremap m N
" custom bracket completion
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>
vnoremap <leader>` <esc>`>a`<esc>`<i`<esc>
vnoremap <leader>( <esc>`>a)<esc>`<i(<esc>
vnoremap <leader>) <esc>`>a)<esc>`<i(<esc>
vnoremap <leader>[ <esc>`>a]<esc>`<i[<esc>
vnoremap <leader>] <esc>`>a]<esc>`<i[<esc>
vnoremap <leader>{ <esc>`>a}<esc>`<i{<esc>
vnoremap <leader>} <esc>`>a}<esc>`<i{<esc>
" quit
nnoremap <leader>Q :q<cr>
" Quick Save
nnoremap <leader>s :w<CR>

" Navigate between buffers
nnoremap <Leader>l :bnext<CR>
nnoremap <Leader>b :bprevious<CR>
" Close buffers with vim-bbye
:nnoremap <Leader>q :Bdelete<CR>

" Use tab to jump between blocks, because it's easier
nnoremap <tab> %
vnoremap <tab> %

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" NerdTree
autocmd vimenter * if @% !~# '.vimrc' && @% !~# '.bash_profile' && @% !~# '.eslintrc.json'| NERDTree | endif  " Open NERDTREE when vim opens
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " Close vim if only NERDTree is open
nnoremap <S-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore=['.git$','.DS_Store']

" vim-airline
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:airline_theme='quantum' " others: badwolf

" Indent / deindent after selecting the text with (⇧ v), (.) to repeat.
vnoremap <Tab> >
vnoremap <S-Tab> <
" comment / decomment & normal comment behavior
vmap <C-m> gc
" Disable tComment to escape some entities
let g:tcomment#replacements_xml={}
" Copy to system clipboard
vnoremap <C-c> :w !pbcopy<cr>
" Undo, Redo
nnoremap <C-z>  :undo<CR>
inoremap <C-z>  <Esc>:undo<CR>
nnoremap <C-y>  :redo<CR>
inoremap <C-y>  <Esc>:redo<CR>

" Toggle Git Gutter
nnoremap  <Leader>g :GitGutterToggle<CR>

"""
""" Copy and Paste
"""
" Fix paste from system clipboard
if &term =~ "xterm.*"
    let &t_ti = &t_ti . "\e[?2004h"
    let &t_te = "\e[?2004l" . &t_te
    function! XTermPasteBegin(ret)
        set pastetoggle=<Esc>[201~
        set paste
        return a:ret
    endfunction
    map <expr> <Esc>[200~ XTermPasteBegin("i")
    imap <expr> <Esc>[200~ XTermPasteBegin("")
    vmap <expr> <Esc>[200~ XTermPasteBegin("c")
    cmap <Esc>[200~ <nop>
    cmap <Esc>[201~ <nop>
endif

" Paste from register 0
nnoremap p "0p

" Move lines up or down
execute "set <M-j>=∆"
execute "set <M-k>=˚"
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

"""
""" Searching
"""
" Find
nnoremap <C-f> /
" CtrlP
" If Ctrl P can't find a file, use CtrlPClearAllCaches to clear
let g:ctrlp_dont_split='NERD' " Play nice with NERDTree
let g:ctrlp_regexp_search=1 " Default to regexp search
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
" nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" bind \ (backward slash) to grep shortcut
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

" Syntastic and ESLint
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_error_symbol = 'ㄨ'
let g:syntastic_style_error_symbol = 'ㄨ'
let g:syntastic_warning_symbol = 'ㄨ'
let g:syntastic_style_warning_symbol = 'ㄨ'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

" syntastic starts in passive mode
autocmd VimEnter * SyntasticToggleMode

" format JSON by saying :FormatJSON
com! FormatJSON %!python -m json.tool

" Abbreviations - fix common typos
iabbrev funcoitn function
iabbrev functoin function
iabbrev funcotin function
iabbrev retrun return
iabbrev deafult default
iabbrev defult default
iabbrev submut submit
iabbrev consructor constructor
iabbrev constuctor constructor
iabbrev consuctor constructor

" NERDTree File highlighting
" function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
"  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
"  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
" endfunction
"
" call NERDTreeHighlightFile('ico', 'green', 'none', 'green', '#151515')
" call NERDTreeHighlightFile('png', 'green', 'none', 'green', '#151515')
" call NERDTreeHighlightFile('jpg', 'green', 'none', 'green', '#151515')
" call NERDTreeHighlightFile('jpeg', 'green', 'none', 'green', '#151515')
"
" call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
" call NERDTreeHighlightFile('map', 'blue', 'none', '#3366FF', '#151515')
" call NERDTreeHighlightFile('js', 'blue', 'none', '#3366FF', '#151515')
"
" call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('lock', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('rc', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('gitignore', 'yellow', 'none', 'yellow', '#151515')
"
" call NERDTreeHighlightFile('html', 'magenta', 'none', 'magenta', '#151515')
" call NERDTreeHighlightFile('twig', 'magenta', 'none', 'magenta', '#151515')
" call NERDTreeHighlightFile('jade', 'magenta', 'none', 'magenta', '#151515')
" call NERDTreeHighlightFile('pug', 'magenta', 'none', 'magenta', '#151515')
"
" call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
" call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
" call NERDTreeHighlightFile('scss', 'cyan', 'none', 'cyan', '#151515')
"
" call NERDTreeHighlightFile('coffee', 'red', 'none', 'red', '#151515')
" call NERDTreeHighlightFile('php', 'red', 'none', '#ff00ff', '#151515')
