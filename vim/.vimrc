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

" highlight EndOfBuffer ctermfg=black ctermbg=black

syntax sync fromstart

set hidden
set redrawtime=10000
set updatetime=300
set cmdheight=2

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

set listchars=
set listchars+=tab:░\ 
set listchars+=trail:·
set listchars+=extends:»
set listchars+=precedes:«
set listchars+=nbsp:⣿

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

nnoremap <silent> <C-w>v :vnew<CR>

nnoremap <leader>t :terminal<CR>
nnoremap <leader>b :Gblame<CR>
nnoremap <leader>a :Ag<CR>
nnoremap <leader>j :JsDoc<CR>
nnoremap <leader>q :qall<CR>
tnoremap jk <C-\><C-n>

" Enable php syntax for drupal theme and module files.
au BufReadPost *.theme set syntax=php
au BufReadPost *.module set syntax=php
au BufReadPost *.lock set syntax=json

augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" Loads plugins def and config

" Start plugins definition
call plug#begin($HOME.'/.local/share/nvim/plugged')


" Plug 'majutsushi/tagbar'
" Plug 'hushicai/tagbar-javascript.vim'
" Plug 'reedes/vim-pencil'
" Plug 'tpope/vim-markdown'
" Plug 'jtratner/vim-flavored-markdown'
" Plug 'kablamo/vim-git-log'
" Plug 'gregsexton/gitv'
" Plug 'tpope/vim-fugitive'
" Plug 'phpvim/phpcd.vim'
" Plug 'tobyS/pdv'
" Plug 'ryanoasis/vim-devicons'
" Plug 'editorconfig/editorconfig-vim'
" Plug 'bronson/vim-trailing-whitespace'
" Plug 'Chiel92/vim-autoformat'
" Plug 'elzr/vim-json'
" Plug 'jeroenbourgois/vim-actionscript'
" Plug 'dylanaraps/wal.vim'
" Plug 'junegunn/vim-easy-align'
" Plug 'terryma/vim-multiple-cursors'
" Plug 'maxbrunsfeld/vim-yankstack'
" Plug 'tpope/vim-surround'
" Plug 'othree/yajs.vim'
" Plug 'othree/javascript-libraries-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
" Plug 'csscomb/vim-csscomb'
" Plug 'othree/html5.vim'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'moll/vim-node'
" Plug 'syngan/vim-vimlint'
" Plug 'ynkdir/vim-vimlparser'
" Plug 'mattn/emmet-vim'
" Plug 'morhetz/gruvbox'
" Plug 'fcpg/vim-fahrenheit'
" Plug 'ayu-theme/ayu-vim'
" Plug 'plasticboy/vim-markdown'
Plug 'lumiliet/vim-twig'
" Plug 'joonty/vdebug'
" Plug 'majutsushi/tagbar'
Plug 'pangloss/vim-javascript'
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'shawncplus/phpcomplete.vim'
" Plug 'mustache/vim-mustache-handlebars'
" Plug 'danhodos/vim-comb'
" Plug 'chrisbra/csv.vim'
" Plug 'arcticicestudio/nord-vim'
" Plug 'dracula/vim'
" Plug 'PotatoesMaster/i3-vim-syntax'
" Plug 'storyn26383/vim-vue'
" Plug 'scrooloose/nerdtree'
Plug 'storyn26383/vim-vue'
" Plug 'tomtom/tcomment_vim'
Plug 'cakebaker/scss-syntax.vim'
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'itchyny/lightline.vim'
" Plug 'leafOfTree/vim-vue-plugin'
" Plug 'tikhomirov/vim-glsl'
" Plug 'Shougo/denite.nvim'
" Plug 'plasticboy/vim-markdown'
" Plug 'nelsyeung/twig.vim'
" Plug 'StanAngeloff/php.vim'
" Plug 'mustache/vim-mustache-handlebars'
Plug 'tpope/vim-commentary'
" Plug 'tyru/caw.vim'

" Plug 'Shougo/context_filetype.vim'

Plug 'heavenshell/vim-jsdoc'
Plug 'othree/jsdoc-syntax.vim'
Plug 'Shougo/defx.nvim'
Plug 'kristijanhusak/defx-icons'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'othree/csscomplete.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mhinz/vim-startify'
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'vim-vdebug/vdebug'
" Plug 'posva/vim-vue'

" Themes
Plug 'ntk148v/vim-horizon'
Plug 'srcery-colors/srcery-vim'
Plug 'connorholyday/vim-snazzy'
Plug 'ayu-theme/ayu-vim'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }

call plug#end()
set termguicolors
set background=dark
set t_Co=256
" let ayucolor="dark"
let ayucolor="mirage"
colorscheme challenger_deep

hi Normal guibg=NONE ctermbg=NONE
hi Comment guifg=#444364
hi LineNr guibg=#19162A

let g:polyglot_disabled = ['vue']

let g:LanguageClient_serverCommands = {
    \ 'vue': ['vls']
    \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN: indentLine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:indentLine_leadingSpaceEnabled = 1
" let g:indentLine_leadingSpaceChar = '∙'
let g:indentLine_char = '┆'
let g:indentLine_first_char = '┆'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN: Startify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:startify_custom_header = []

let g:startify_lists = [
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ ]

let g:startify_bookmarks = [
          \ {'c': '~/.vimrc'},
          \ {'z': '~/.zshrc'},
          \ {'e': '~/Development/ch.migros.engagement-hub'},
          \ {'m': '~/Development/ch.migros.karriere'},
          \ {'s': '~/Development/shader.how'},
          \ {'d': '~/Development/drawmote-client'},
          \ {'o': '~/Development/oris-web'},
          \ ]

let g:startify_session_persistence = 1
let g:startify_change_to_vcs_root = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN: Lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

      " \ 'colorscheme': 'srcery',
let g:lightline = {
      \ 'colorscheme': 'challenger_deep',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN: coc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" command! -nargs=0 Prettier :CocCommand prettier.formatFile

vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" autocmd BufWritePost *.vue Prettier

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN: vim-vue
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd FileType vue syntax sync fromstart
" autocmd BufReadPost,BufNewFile *.vue setlocal filetype=vue

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN: deoplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:deoplete#enable_at_startup = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN: Javascript
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:javascript_plugin_jsdoc = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN: Windowswap
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" - Navigate to the window you'd like to move
" - Press <leader>ww
" - Navigate to the window you'd like to swap with
" - Press <leader>ww again


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN: Defx
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:loaded_netrwPlugin = 1 " Disable netrw.vim

" autocmd FileType defx call s:defx_my_settings()

augroup defxConfig
  autocmd!
  autocmd FileType defx call s:defx_my_settings()
augroup END


function! s:defx_my_settings() abort

  " Open commands
  " nnoremap <silent><buffer><expr> <CR> defx#do_action('open')
  nnoremap <silent><buffer><expr> <CR> defx#do_action('open', 'wincmd w \| drop')
  nnoremap <silent><buffer><expr> l defx#do_action('open')
  nnoremap <silent><buffer><expr> v defx#do_action('open', 'vsplit')
  " Preview current file
  " nnoremap <silent><buffer><expr> s defx#do_action('open', 'pedit')

  " File manipulation
  nnoremap <silent><buffer><expr> K defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> <Del> defx#do_action('remove')
  nnoremap <silent><buffer><expr> r defx#do_action('rename')
  nnoremap <silent><buffer><expr> yy defx#do_action('copy')
  nnoremap <silent><buffer><expr> dd defx#do_action('move')
  nnoremap <silent><buffer><expr> pp defx#do_action('paste')

  "Navigation
  nnoremap <silent><buffer><expr> - defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> h defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> j line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> ~ defx#do_action('cd', [getcwd()])

  " Miscellaneous actions
  nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> q defx#do_action('quit')
  nnoremap <silent><buffer><expr> x defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yp defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> <C-g> defx#do_action('print')
  nnoremap <silent><buffer><expr> <C-l> defx#do_action('redraw') . ':nohlsearch<cr>:syntax sync fromstart<cr><c-l>'

  nnoremap <silent><buffer><expr><nowait> <Space> defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> * defx#do_action('toggle_select_all')

  nnoremap <silent><buffer><expr> C defx#do_action('toggle_columns', 'mark:filename:type:size:time')
  nnoremap <silent><buffer><expr> S defx#do_action('toggle_sort', 'time')

  " nnoremap <silent><buffer><expr>e defx#do_action('call', 'DefxExternalExplorer')
  nnoremap <silent><buffer><expr> e defx#do_action('call', 'OpenRanger')
endfunction

" nnoremap <silent> <leader>o :call OpenRanger()<cr>
nnoremap <silent> <C-t> :Defx `expand('%:p:h')` -new -show-ignored-files -search=`expand('%:p')` -columns=icons:indent:filename:type<CR>
nnoremap <Leader>- :Defx -split=vertical -winwidth=50 -direction=topleft<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN: NERD Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let NERDTreeShowHidden=1
" map <C-t> :NERDTreeToggle<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN: FZF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default zf layout
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

" map <C-p> :Files<CR>
nnoremap <silent> <C-p> :call fzf#run({ 'source': 'ag -g ""', 'sink': 'e', 'window': 'enew' })<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN: Prettier
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mapping '/remote/path' : '/local/path'
let g:vdebug_options = {}
let g:vdebug_options.path_maps = {
      \  '/var/www/ch.migros.karriere/web' : '/Users/dulnan/Development/ch.migros.karriere/web',
      \  '/var/www/oris-web' : '/Users/dulnan/Development/oris-web',
      \}


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
  let g:ctrlp_path_nolim = 0
  let g:ctrlp_match_natural_name = 1
  let g:ctrlp_working_path_mode = 0
  let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn|sql))$'
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCTION: Search and replace
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! GlobalSearchReplace()
  call inputsave()
  let folder    = input('Folder:   ', '', 'dir')

  let extension = expand('%:e')
  if extension != ''
    let pattern_default = '**/*.' . extension
  else
    let pattern_default = '**/*.*'
  endif

  let pattern   = input('Pattern:  ', pattern_default)

  let search    = input('Search:   ', '')
  let replace   = input('Replace:  ')
  call inputrestore()

  execute 'args ' . folder . pattern
  set nomagic
  execute 'argdo %s/'.search.'/'.replace.'/g'
  set magic
endfunction

command SearchReplace call GlobalSearchReplace()
