let MACENV = $MACENV

filetype plugin on

let g:vimDir = $HOME.'/.vim'

let g:hardcoreMode = 1

let s:pluginDir  = g:vimDir.'/plugins/plugged'
let s:pluginDef  = g:vimDir.'/plugins/def.vim'
let s:pluginConf = g:vimDir.'/plugins/config.vim'

let g:vdebug_options = {}
let g:vdebug_options["port"] = 9000
let g:vdebug_options["server"] = ''
"let g:vdebug_options['ide_key'] = 'PHPSTORM'
" Mapping '/remote/path' : '/local/path'
let g:vdebug_options["server"] = ''
"let g:vdebug_options['ide_key'] = 'ECLIPSE'
let g:vdebug_options['path_maps'] = {
      \  '/var/www/ch.migros.karriere/web' : '~/Development/ch.migros.karriere/web',
      \}


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
set relativenumber

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



"let g:indent_guides_auto_colors = 0
let g:indent_guides_auto_colors = 1
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

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
set ignorecase 

set hlsearch
set incsearch

set timeoutlen=1000
set ttimeoutlen=0

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

au BufReadPost *.theme set syntax=php
au BufReadPost *.module set syntax=php
au BufReadPost *.lock set syntax=json

let g:jsdoc_enable_es6=1
let g:used_javascript_libs = 'jquery,underscore,vue,handlebars'

let g:javascript_plugin_jsdoc = 1


" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif




"let g:ctrlp_custom_ignore = {
  "\ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc\|web\/themes\/asvz\|public\/system\|data\|log\|tmp$',
  "\ 'file': '\v\.(exe|so|dll)$',
  "\ 'link': 'some_bad_symbolic_links',
  "\ }
"let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

"let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|web)|(\.(swp|ico|git|svn))$'

"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'
"let g:ctrlp_working_path_mode = 'r'

let g:indent_guides_enable_on_vim_startup = 1

nmap <F13> :TagbarToggle<CR>
"
" WebVim Configuration : global mapping
"
" author: Bertrand Chevrier <chevrier.bertrand@gmail.com>
"

" leader
let g:mapleader = ","
let g:localmapleader = "\\"

map <C-t> :NERDTreeToggle<CR>

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
map <C-t> :NERDTreeToggle<CR>

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
autocmd BufRead,BufNewFile .eslintrc setfiletype json
autocmd BufRead,BufNewFile .jshintrc setfiletype json
autocmd FileType vue syntax sync fromstart
au BufReadPost *.theme set syntax=php
au BufReadPost *.module set syntax=php

" Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif



" Loads plugins def and config
exec ":source ".s:pluginDef
exec ":source ".s:pluginConf
