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

nnoremap <C-w>v :vnew<CR>

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

""Plug 'junegunn/vim-easy-align'
"Plug 'terryma/vim-multiple-cursors'
""Plug 'maxbrunsfeld/vim-yankstack'
"Plug 'tpope/vim-surround'
""Plug 'othree/yajs.vim'
" Plug 'othree/javascript-libraries-syntax.vim'
"Plug 'hail2u/vim-css3-syntax'
" Plug 'cakebaker/scss-syntax.vim'
"Plug 'csscomb/vim-csscomb'
" Plug 'othree/html5.vim'
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

Plug 'storyn26383/vim-vue'
Plug 'mboughaba/i3config.vim'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'Shougo/context_filetype.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'itchyny/lightline.vim'
Plug 'ntk148v/vim-horizon'
Plug 'srcery-colors/srcery-vim'
Plug 'tpope/vim-fugitive'
Plug 'othree/csscomplete.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tikhomirov/vim-glsl'
Plug 'mhinz/vim-startify'
Plug 'Shougo/denite.nvim'
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'nelsyeung/twig.vim'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'ayu-theme/ayu-vim'
Plug 'connorholyday/vim-snazzy'

Plug 'mustache/vim-mustache-handlebars'

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

command! -nargs=0 Prettier :CocCommand prettier.formatFile

vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

autocmd BufWritePost *.vue Prettier

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN: deoplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
autocmd FileType css,sass,scss setlocal omnifunc=csscomplete#CompleteCSS noci

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
" PLUGIN: NERD Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let NERDTreeShowHidden=1
map <C-t> :NERDTreeToggle<CR>


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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN: Prettier
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CONFIG: Veonim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists('veonim')

" extensions for web dev
let g:vscode_extensions = [
  \'vscode.typescript-language-features',
  \'vscode.css-language-features',
  \'vscode.html-language-features',
  \'vscode.json-language-features',
  \'vscode.markdown-language-features',
  \'vscode.php-language-features',
  \'octref.vetur',
  \'christian-kohler.npm-intellisense',
  \'mrmlnc.vscode-scss',
  \'slevesque.shader',
  \'mblode.twig-language-2',
\]

" multiple nvim instances
nno <silent> <c-t>c :Veonim vim-create<cr>
nno <silent> <c-g> :Veonim vim-switch<cr>
nno <silent> <c-t>, :Veonim vim-rename<cr>

" workspace functions
nno <silent> ,f :Veonim files<cr>
nno <silent> ,e :Veonim explorer<cr>
nno <silent> ,b :Veonim buffers<cr>
nno <silent> ,d :Veonim change-dir<cr>
"or with a starting dir: nno <silent> ,d :Veonim change-dir ~/proj<cr>

" searching text
nno <silent> <space>fw :Veonim grep-word<cr>
vno <silent> <space>fw :Veonim grep-selection<cr>
nno <silent> <space>fa :Veonim grep<cr>
nno <silent> <space>ff :Veonim grep-resume<cr>
nno <silent> <space>fb :Veonim buffer-search<cr>

" language features
nno <silent> sr :Veonim rename<cr>
nno <silent> sd :Veonim definition<cr>
nno <silent> si :Veonim implementation<cr>
nno <silent> st :Veonim type-definition<cr>
nno <silent> sf :Veonim references<cr>
nno <silent> sh :Veonim hover<cr>
nno <silent> sl :Veonim symbols<cr>
nno <silent> so :Veonim workspace-symbols<cr>
nno <silent> sq :Veonim code-action<cr>
nno <silent> sk :Veonim highlight<cr>
nno <silent> sK :Veonim highlight-clear<cr>
nno <silent> ,n :Veonim next-usage<cr>
nno <silent> ,p :Veonim prev-usage<cr>
nno <silent> sp :Veonim show-problem<cr>
nno <silent> <c-n> :Veonim next-problem<cr>
nno <silent> <c-p> :Veonim prev-problem<cr>

endif

