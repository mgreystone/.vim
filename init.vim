" ~/.vimrc

" set exrc
" set secure

" no vi compat
set nocompatible

" filetype func
filetype off
filetype plugin indent on

" leader = spacebar
let g:mapleader = ' '

" I like to use the ~/.vim directory instead of the ~/.config/nvim directory
set runtimepath+=~/.vim

" Plug
call plug#begin('~/.vim/plugged')
" start- all plugins below

Plug 'icymind/NeoSolarized'
Plug 'shaunsingh/solarized.nvim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'kburdett/vim-nuuid'
" Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdtree'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'moll/vim-bbye'

if has('python3')
  Plug 'roxma/nvim-yarp'
  " Plug 'ncm2/ncm2'
  " Plug 'ncm2/ncm2-path'
  " Plug 'ncm2/ncm2-bufword'
  " Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
  " Plug 'ncm2/ncm2-cssomni'

  " autocmd BufEnter * call ncm2#enable_for_buffer()
  set completeopt=noinsert,menuone,noselect
  set shortmess+=c
  inoremap <expr> <CR> (pumvisible() ? "\<C-y>" : "\<CR>")
  inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
endif

Plug 'jiangmiao/auto-pairs'
let g:AutoPairsMultilineClose = 0 " disable line jumping for closing pair
let g:AutoPairsMapCR = 1

Plug 'tpope/vim-commentary'
Plug 'jasminabasurita/NeoDim', {'frozen': 1}
Plug 'dracula/vim' " , {'commit': '0743d3d7b3769d012827bc8d1e5375164791cc2f'}
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'mxw/vim-jsx'
Plug 'farfanoide/vim-kivy'
Plug 'mileszs/ack.vim'
nnoremap <leader>ag :Ack!<space>
let g:ackprg = 'ag --nogroup --nocolor --column'

Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$|bower_components|node_modules',
  \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
\ }
Plug 'w0rp/ale'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'elzr/vim-json'
Plug 'othree/jspc.vim'
Plug 'tpope/vim-surround'
Plug 'ryanoasis/vim-devicons'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ap/vim-css-color'
Plug 'godlygeek/tabular'
Plug 'embear/vim-localvimrc'
" Plug 'LucHermitte/lh-vim-lib'
" Plug 'LucHermitte/local_vimrc'
Plug 'othree/html5.vim'
" Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'leafOfTree/vim-svelte-plugin'

let g:vim_svelte_plugin_load_full_syntax = 1
let g:svelte_preprocessors = ['typescript']
" let g:syntastic_svelte_checkers = ['javascript/eslint']

let g:vim_svelte_plugin_use_typescript = 1

" Build Composer function for markdown composer
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
Plug 'digitaltoad/vim-pug', { 'for': ['jade', 'pug'] }
Plug 'elixir-editors/vim-elixir'

Plug 'leafgarland/typescript-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jparise/vim-graphql'


" stop - all plugins above
call plug#end()

" set color
set termguicolors
set background=dark
colorscheme NeoSolarized
" colorscheme solarized
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
highlight Difftext ctermbg=NONE guibg=NONE
let &colorcolumn=join(range(81,999),",")

" vim-markdown-composer
let g:markdown_composer_syntax_theme='dracula'
" let g:markdown_composer_autostart=0
" nnoremap <C-m> :ComposerStart<CR>

" Indentation Guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#002B36 ctermbg=15
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#073642 ctermbg=NONE

" AIRLINE CONFIG
let g:airline_theme='neodim'
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#ale#enabled=1

" " Save and Reload Folds!
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent! loadview
 
" NERDTREE
" NERDTree shortcut
noremap <F1> :NERDTreeToggle<CR>
" Show dot files (ie. .vimrc)
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeShowHidden=1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
" Auto Open NERDTree when vim is opened with no args or when file opened is a
" directory. Else only open file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" Close vim if only NERDTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDTree Syntax Highlighting
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
" let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeLimitedSyntax=1

" Built in Vim Settings
set colorcolumn=80
set cursorline    " highlight current line
set hidden        " allow for modified buffers to be in the background, makes buffers feel more like tabs
set tabstop=2     " show existing tab with 2 spaces width
set shiftwidth=2  " when indenting with '>', use 2 spaces width
set shiftround    " Round to the nearest tab
set expandtab     " On pressing tab, insert 2 spaces
set autoindent    " Enable auto-indent
set smarttab      " Tab smarter
set number relativenumber   " Show line numbers
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
scriptencoding utf-8
set hlsearch        " Highlight previous search pattern
set ignorecase      " Ignore case in search pattern
set smartcase       " ^ But be smart about it
set noshowmode
set clipboard+=unnamedplus " set system clipboard as the default register
set guicursor=n:blinkon1
set diffopt=vertical,filler
set inccommand=nosplit " highlight substitutions

" ALE CONIGURATIONS
let g:ale_linter_aliases = {'svelte': ['svelte', 'css', 'javascript']}
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'javascript.jsx': ['eslint'],
\   'typescript': ['eslint'],
\   'typescriptreact': ['eslint'],
\   'python': ['flake8'],
\   'css': ['stylelint'],
\   'scss': ['stylelint'],
\   'vim': ['vint'],
\   'svelte': ['svelteserver', 'eslint', 'stylelint']
\}
let g:ale_fixers = { 
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\   'typescriptreact': ['eslint'],
\   'python': ['autopep8', 'yapf'],
\   'css': ['stylelint'],
\   'scss': ['stylelint'],
\   'json': ['prettier'],
\   'markdown': ['prettier'],
\   'svelte': ['eslint'. 'stylelint'],
\   'terraform': ['terraform']
\}

" with prettier
" \   'javascript': ['prettier', eslint'],
" \   'css': ['prettier', 'stylelint'],
" \   'scss': ['prettier', 'stylelint'],
" \   'json': ['prettier'],

let g:ale_javascript_prettier_use_local_config = 1

let g:ale_sign_column_always = 1
let g:ale_sign_warning = '>>'
highlight ALEError ctermbg=none guibg=none cterm=underline gui=underline
highlight ALEWarning ctermbg=none guibg=none cterm=underline gui=underline
highlight clear ALEErrorSign
highlight clear ALEWarningSign
highlight ALEErrorSign guibg='#5F0000' gui=underline
highlight ALEWarningSign guifg='#F1FA8C'
let g:ale_fix_on_save = 0
noremap <C-F>  :ALEFix <CR>

let s:sdks = finddir('.yarn/sdks', ';')
if !empty(s:sdks)
  let g:ale_javascript_eslint_use_global = 1
  let g:ale_javascript_eslint_executable = s:sdks . '/eslint/bin/eslint.js'
  let g:ale_javascript_flow_ls_use_global = 1
  let g:ale_javascript_flow_ls_executable = s:sdks . '/flow-bin/cli.js'
  let g:ale_javascript_prettier_use_global = 1
  let g:ale_javascript_prettier_executable = s:sdks . '/prettier/index.js'
endif

" My Key Mappings
" clears vims search highlight with F2
nnoremap  <silent> <F2> :noh<cr>
noh
" Exit insert mode with ease
inoremap jk <Esc>
" In the terminal too!
tnoremap jk <C-\><C-N>
" capitalize a word in insert or normal mode
inoremap <C-u> <Esc>viwUea
nnoremap <C-u> viwUe
" Easier Split Navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" more natural splits
set splitbelow
set splitright
" Delete Buffer without closing window
nnoremap <Leader>q :Bdelete<CR>
" Easier Buffer Switching
nnoremap <Leader>h :bp<CR>
nnoremap <Leader>l :bn<CR>
nnoremap <Leader>1 :b1<CR>
nnoremap <Leader>2 :b2<CR>
nnoremap <Leader>3 :b3<CR>
nnoremap <Leader>4 :b4<CR>
nnoremap <Leader>5 :b5<CR>
nnoremap <Leader>6 :b6<CR>
nnoremap <Leader>7 :b7<CR>
nnoremap <Leader>8 :b8<CR>
nnoremap <Leader>9 :b9<CR>
" Faster Navigation
" nnoremap H ^
" nnoremap L $
" nnoremap J 4j
" nnoremap K 4k
" vnoremap H ^
" vnoremap L $
" vnoremap J 4j
" vnoremap K 4k
" onoremap H ^
" onoremap L $
" onoremap J 4j
" onoremap K 4k
" Add Punctuation to end of line or line break
nnoremap <leader><CR> i<CR><Esc>
" Flatten
" nnoremap F J
nnoremap <leader>; $a;<Esc>
nnoremap <leader>, $a,<Esc>
" Add Symbol after Cursor
nnoremap <leader>} a}<Esc>
nnoremap <leader>) a)<Esc>
nnoremap <leader>] a]<Esc>
nnoremap <leader>" a"<Esc>
nnoremap <leader>' a'<Esc>
" Surround Selection in /* */
vnoremap <leader>/ <Esc>`>a*/<Esc>`<i/*<Esc>
" React comment
vnoremap <leader>rc <Esc>`>a*/}<Esc>`<i{/*<Esc>
" Make it easier to open and edit vim whenever!
nnoremap <leader>ev :edit ~/.vim/init.vim <cr>
" And resource the vimrc with ease!
nnoremap <leader>sv :source $MYVIMRC<cr>
" Moving through grep
nnoremap <leader>n :cn<CR>
nnoremap <leader>p :cp<CR>

" My Abbreviations
iabbrev ireact import React from 'react'
iabbrev ireactrouter import {  } from 'react-router-dom'
iabbrev iaxios import axios from 'axios'
iabbrev rrouter const router = require('express').Router()

" Get Rid of Git Gutters key mappings
let g:gitgutter_map_keys = 0

" my javascript libraries
let g:used_javascript_libs = 'angularjs,react,jquery,underscore,angularuirouter,flux,requirejs,jasmine,chai,d3'

" vim-jsx - allow syntax highlighting in .js files
let g:jsx_ext_required = 0

" Save Files With Root Priveleges
command! -nargs=0 Sw w !sudo tee % > /dev/null

let g:localvimrc_whitelist = [$HOME.'/src/mondrian/', $HOME.'/src/mondrian-api/', $HOME.'/src/writers-block', $HOME.'/src/webpack-rise-packages', $HOME.'/src/rise-frontend-learn-module-sample', $HOME.'/src/amygdala-demo', $HOME.'/src/hocuspocus', $HOME.'/src/rise-content', $HOME.'/src/rise-l10n-review-proto', $HOME.'/src/rise-authoring-dashboard']

" Stop recording
" nnoremap q <Nop> 
"

" COC

" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
" if has('nvim-0.4.0') || has('patch-8.2.0750')
"   nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"   inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"   inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"   vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
" endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

let g:coc_global_extensions = ['coc-tsserver']
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
