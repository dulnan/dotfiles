let MACENV = $MACENV

filetype plugin on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf8
set nocompatible
set noshowmode                      " don't show --- INSERT ---
set nowrap                          " wrap end of line
set number                          " show line numbers
set relativenumber                  " show relative numbers
syntax on                           " syntax highlighting
set clipboard=unnamedplus
set foldmethod=manual
set mouse=a
set spelllang=en_us
set nospell
set ruler
set laststatus=2
set nocursorline

set omnifunc=syntaxcomplete#Complete
set completefunc=LanguageClient#complete

highlight EndOfBuffer ctermfg=black ctermbg=black

syntax sync fromstart

set redrawtime=10000

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" INDENTATION
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set smartindent
set autoindent
set copyindent
set shiftwidth=2
set tabstop=2
set shiftround
set backspace=indent,eol,start
set smarttab
set expandtab
set list

filetype indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SEARCHING
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showmatch
set ignorecase
set hlsearch
set incsearch
set timeoutlen=1000
set ttimeoutlen=0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEY MAPPING
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:mapleader = ","
let g:localmapleader = "\\"

nmap <F13> :TagbarToggle<CR>

" move the current line below
nnoremap <M-j> ddp

" move the current line above
nnoremap <M-k> ddkP

" switch tab
nnoremap <Tab> :tabn<CR>
nnoremap <S-left> :tabp<CR>

" insert mode uppercase the current word
"  <esc> : go to normal mode
"  v    : visual mode
"  iw    : select the current word
"  U    : uppercase selection
"  i    : back to insert mode
inoremap <c-u> <esc>viwUi

" remove last search highlight
nnoremap <C-l> :nohlsearch<CR><C-l>

" Wrap a word in double quotes
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

" Wrap a word in single quotes
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel

" select inside parents
onoremap in( :<c-u>normal! f(vi(<cr>

" select inside braces
onoremap in{ :<c-u>normal! f{vi{<cr>

" select inside brackets
onoremap in[ :<c-u>normal! f[vi[<cr>

" Open MYVIMRC in a vsplit
nnoremap <leader>ev :split $MYVIMRC<cr>

" Source MYVIMRC
nnoremap <leader>sv :source $MYVIMRC<cr>

" Leave insert mode (like <esc>) and disable <esc>
inoremap jk <esc>
inoremap <special> <esc> <nop>
inoremap <esc>^[ <esc>^[

" Disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

nnoremap <C-w>v :vnew<CR>

"
" Autocommands
"

" Force filetype
"autocmd BufRead,BufNewFile .eslintrc setfiletype json
"autocmd BufRead,BufNewFile .jshintrc setfiletype json
"au BufReadPost *.theme set syntax=php
"au BufReadPost *.module set syntax=php

" Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif


"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4


au BufReadPost *.theme set syntax=php
au BufReadPost *.module set syntax=php
au BufReadPost *.lock set syntax=json

autocmd BufEnter,InsertLeave * :syntax sync fromstart

augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END


" Loads plugins def and config

" Start plugins definition
call plug#begin($HOME.'/.local/share/nvim/plugged')

Plug 'maksimr/vim-jsbeautify'

Plug 'mboughaba/i3config.vim'

Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'hushicai/tagbar-javascript.vim'
Plug 'wesQ3/vim-windowswap'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'godlygeek/tabular'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'reedes/vim-pencil'
Plug 'tpope/vim-markdown'
Plug 'jtratner/vim-flavored-markdown'
Plug 'kablamo/vim-git-log'
Plug 'gregsexton/gitv'
Plug 'tpope/vim-fugitive'

Plug 'phpvim/phpcd.vim'
Plug 'tobyS/pdv'

Plug 'ryanoasis/vim-devicons'

Plug 'scrooloose/nerdcommenter'

Plug 'editorconfig/editorconfig-vim'
Plug 'bronson/vim-trailing-whitespace'

Plug 'Chiel92/vim-autoformat'
Plug 'elzr/vim-json'

Plug 'jeroenbourgois/vim-actionscript'

Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }

Plug 'w0rp/ale'
" Plug 'posva/vim-vue'
" Plug 'pangloss/vim-javascript' , { 'for': ['javascript', 'javascript.jsx', 'html', 'vue'] }

Plug 'storyn26383/vim-vue'
Plug 'pangloss/vim-javascript'
Plug 'hail2u/vim-css3-syntax'

Plug 'itchyny/lightline.vim'
Plug 'ayu-theme/ayu-vim'

Plug 'dylanaraps/wal.vim'

""Plug 'junegunn/vim-easy-align'
"Plug 'terryma/vim-multiple-cursors'
""Plug 'maxbrunsfeld/vim-yankstack'
"Plug 'tpope/vim-surround'
""Plug 'othree/yajs.vim'
Plug 'othree/javascript-libraries-syntax.vim'
"Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
"Plug 'csscomb/vim-csscomb'
Plug 'othree/html5.vim'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
""Plug 'moll/vim-node'
""Plug 'syngan/vim-vimlint'
""Plug 'ynkdir/vim-vimlparser'
""Plug 'mattn/emmet-vim'
""Plug 'morhetz/gruvbox'
"Plug 'fcpg/vim-fahrenheit'
""Plug 'ayu-theme/ayu-vim'
Plug 'heavenshell/vim-jsdoc'
"Plug 'plasticboy/vim-markdown'
"Plug 'lumiliet/vim-twig'
"Plug 'joonty/vdebug'
"Plug 'majutsushi/tagbar'
"Plug 'pangloss/vim-javascript'
"Plug 'nathanaelkane/vim-indent-guides'
"Plug 'shawncplus/phpcomplete.vim'
"Plug 'mustache/vim-mustache-handlebars'
"Plug 'danhodos/vim-comb'
"Plug 'chrisbra/csv.vim'
"Plug 'arcticicestudio/nord-vim'
"Plug 'dracula/vim'
"Plug 'PotatoesMaster/i3-vim-syntax'
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN: Windowswap
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" - Navigate to the window you'd like to move
" - Press <leader>ww
" - Navigate to the window you'd like to swap with
" - Press <leader>ww again



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN: NERD Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeShowHidden=1
map <C-t> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN: Tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-m> :TagbarToggle<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN: FZF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN: NerdCommenter 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1


"noremap <c-o> :call NERDComment(0, "Toggle")<cr>
nmap <c-o> <plug>NERDCommenterToggle
vmap <c-o> <plug>NERDCommenterToggle gv



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN: YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start autocompletion after 4 chars
let g:ycm_min_num_of_chars_for_completion = 4
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_enable_diagnostic_highlighting = 0
" Don't show YCM's preview window [ I find it really annoying ]
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN: Vue
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN: JsBeaufity
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>= :call JsBeautify()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN: JsDoc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! -register JsDoc call jsdoc#insert()
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_input_description = 1
let g:jsdoc_enable_es6 = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN: ctrlp
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
  let g:ctrlp_path_nolim = 1
  let g:ctrlp_match_natural_name = 1
  let g:ctrlp_working_path_mode = 0
  let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
endif

" set t_Co=256
highlight Normal ctermfg=grey ctermbg=black
colorscheme wal

let g:lightline = {
      \ 'colorscheme': 'wal',
      \ }
