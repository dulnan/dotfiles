"
" WebVim Configuration entry point
"
" author: Bertrand Chevrier <chevrier.bertrand@gmail.com>
" source: https://github.com/krampstudio/dotvim
" year  : 2015
"


" You won't find any configuration here directly,

" and under plugins for plugins configuration
" please look at files under the config folder for global config


filetype plugin on

let g:vimDir = $HOME.'/.vim'

let g:hardcoreMode = 1

let s:pluginDir  = g:vimDir.'/plugins/plugged'
let s:pluginDef  = g:vimDir.'/plugins/def.vim'
let s:pluginConf = g:vimDir.'/plugins/config.vim'


" Loads the global config, mapping and settings
"
" WebVim Configuration : global settings
"
" author: Bertrand Chevrier <chevrier.bertrand@gmail.com>
" source: https://github.com/krampstudio/dotvim
" year  : 2015
"

" wrap end of lin
set wrap

" show line numbers
set number

" syntax highlighting
syntax on
set background=dark
set t_Co=256
let g:vue_disable_pre_processors=1
"set termguicolors
"colorscheme fahrenheit 
colorscheme spacegray 
let g:airline_theme='fahrenheit'
let ayucolor="mirage"
"indent
set smartindent
set autoindent
set copyindent
set shiftwidth=2
set shiftround
set backspace=indent,eol,start
set smarttab
set expandtab
set tabstop=2
"search
set showmatch
set smartcase

set hlsearch
set incsearch


" copy/paste
"set paste
set clipboard=unnamedplus

" folding manual
set foldmethod=manual

" mouse
set mouse=a

" spell check, to be activated manually
set spelllang=en_us
set nospell

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'

"
" WebVim Configuration : global mapping
"
" author: Bertrand Chevrier <chevrier.bertrand@gmail.com>
"

" leader
let g:mapleader = ","
let g:localmapleader = "\\"

" move the current line below
nnoremap <M-j> ddp

" move the current line above
nnoremap <M-k> ddkP

" switch tab
nnoremap <S-right> :tabn<CR>
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


if g:hardcoreMode == 1

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
endif



"
" WebVim Configuration : autocommands
"
" author: Bertrand Chevrier <chevrier.bertrand@gmail.com>
" source: https://github.com/krampstudio/dotvim
" year  : 2015
"


" Force filetype

autocmd BufRead,BufNewFile .eslintrc setfiletype json
autocmd BufRead,BufNewFile .jshintrc setfiletype json


" Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif



" Loads plugins def and config
exec ":source ".s:pluginDef
exec ":source ".s:pluginConf
