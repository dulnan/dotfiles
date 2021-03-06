let MACENV = $MACENV

let g:python3_host_prog='/usr/bin/python3.8'
let g:python_host_prog='/usr/bin/python2.7'

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
set clipboard=unnamed
set foldmethod=manual
set mouse=a
set spelllang=en_us
set nospell
set ruler
set laststatus=2
set nocursorline
set iskeyword-=_

" highlight EndOfBuffer ctermfg=black ctermbg=black

syntax sync fromstart

set hidden
set redrawtime=10000
set updatetime=300
set cmdheight=2

set conceallevel=0

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
let g:mapleader = "\<Space>"
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
nnoremap <leader>s :source $MYVIMRC<cr>

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
nnoremap <leader>l :Gblame<CR>
nnoremap <leader>a :Ag<CR>
nnoremap <leader>j :JsDoc<CR>
nnoremap <leader>q :qall<CR>
tnoremap jk <C-\><C-n>

" Enable php syntax for drupal theme and module files.
au BufReadPost *.lock set syntax=json

" au BufReadPost *.njk set syntax=html.twig
autocmd bufreadpre *.twig setlocal textwidth=0
" autocmd bufreadpre *.njk setlocal textwidth=0
autocmd bufreadpre *.html setlocal textwidth=0

" Drupal *.module and *.install files.
augroup module
  autocmd BufRead,BufNewFile *.module set filetype=php
  autocmd BufRead,BufNewFile *.theme set filetype=php
  autocmd BufRead,BufNewFile *.install set filetype=php
  autocmd BufRead,BufNewFile *.test set filetype=php
  autocmd BufRead,BufNewFile *.inc set filetype=php
  autocmd BufRead,BufNewFile *.profile set filetype=php
  autocmd BufRead,BufNewFile *.view set filetype=php
augroup END

autocmd BufReadPost,BufNewFile *.njk setlocal filetype=html.twig

" Loads plugins def and config

" Start plugins definition
call plug#begin($HOME.'/.local/share/nvim/plugged')

" Plug 'hail2u/vim-css3-syntax'
Plug 'plasticboy/vim-markdown'
Plug 'agfline/c-syntax.vim'
" Plug 'lumiliet/vim-twig'
Plug 'nelsyeung/twig.vim'
Plug 'pangloss/vim-javascript'
Plug 'cakebaker/scss-syntax.vim'
" Plug 'tpope/vim-commentary'
Plug 'tomtom/tcomment_vim'
Plug 'heavenshell/vim-jsdoc'
Plug 'othree/jsdoc-syntax.vim'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kristijanhusak/defx-icons'
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'laher/fuzzymenu.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'
Plug 'arrufat/vala.vim'
" Plug 'othree/csscomplete.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'mhinz/vim-startify'
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'vim-vdebug/vdebug'
Plug 'posva/vim-vue'
Plug 'mustache/vim-mustache-handlebars'
Plug 'niftylettuce/vim-jinja'
Plug 'derekwyatt/vim-scala'
" Plug 'leafOfTree/vim-vue-plugin'
" Plug 'storyn26383/vim-vue'
Plug 'leafgarland/typescript-vim'
" Plug 'yuratomo/w3m.vim'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'amadeus/vim-mjml'
Plug 'dylanaraps/wal.vim'
Plug 'jparise/vim-graphql'

Plug 'easymotion/vim-easymotion'
Plug 'chr4/nginx.vim'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'rhysd/vim-clang-format'

" Themes
Plug 'ntk148v/vim-horizon'
Plug 'srcery-colors/srcery-vim'
Plug 'connorholyday/vim-snazzy'
Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'ntk148v/vim-horizon'
Plug 'ayu-theme/ayu-vim-airline'


call plug#end()
set termguicolors
set t_Co=256
" let ayucolor="dark"
" let ayucolor="dark"
" colorscheme horizon

" hi Comment guifg=#444364
" hi LineNr guibg=#19162A

let html_no_rendering=1

" let g:gruvbox_contrast_dark = 'hard'
" let g:gruvbox_vert_split = 'bg1'
set background=dark
colorscheme srcery

" hi Normal guibg=NONE ctermbg=NONE
" autocmd ColorScheme * highlight! Normal ctermbg=NONE guibg=NONE

let g:lightline = {
      \ 'colorscheme': 'srcery',
      \ }

let g:LanguageClient_serverCommands = {
    \ 'vue': ['vls']
    \ }


let g:vim_vue_plugin_load_full_syntax = 1
let g:vim_vue_plugin_use_sass = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN: indentLine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:indentLine_leadingSpaceEnabled = 1
" let g:indentLine_leadingSpaceChar = '∙'
" let g:indentLine_char = '┆'
" let g:indentLine_first_char = '┆'
" let g:indentLine_showFirstIndentLevel = 1
" let g:indentLine_setColors = 1
" let g:indentLine_setConceal = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN: markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_markdown_folding_disabled = 1

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
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" let g:airline_theme='ayu'
let g:airline#extensions#branch#enabled = 0

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
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" command! -nargs=0 Prettier :CocCommand prettier.formatFile

vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

let g:coc_filetype_map = {
      \ 'jinja': 'html',
      \ }

" autocmd BufWritePost *.vue Prettier

" Twig

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN: vim-vue
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd FileType vue syntax sync fromstart
" autocmd BufReadPost,BufNewFile *.vue setlocal filetype=vue

" autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
" let g:vim_vue_plugin_load_full_syntax = 1
" let g:vim_vue_plugin_debug = 1

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

" augroup fzf
"   autocmd!
"   autocmd! FileType fzf
"   autocmd  FileType fzf set laststatus=0 noshowmode noruler
"     \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
" augroup END

"
" This is the default extra key bindings
" let g:fzf_action = {
"   \ 'ctrl-t': 'tab split',
"   \ 'ctrl-x': 'split',
"   \ 'ctrl-v': 'vsplit' }

" Default zf layout
" - down / up / left / right
" let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
" let g:fzf_layout = { 'window': '-tabnew' }

" Customize fzf colors to match your color scheme
" let g:fzf_colors =
" \ { 'fg':      ['fg', 'Normal'],
"   \ 'bg':      ['bg', 'Normal'],
"   \ 'hl':      ['fg', 'Comment'],
"   \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"   \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"   \ 'hl+':     ['fg', 'Statement'],
"   \ 'info':    ['fg', 'PreProc'],
"   \ 'prompt':  ['fg', 'Conditional'],
"   \ 'pointer': ['fg', 'Exception'],
"   \ 'marker':  ['fg', 'Keyword'],
"   \ 'spinner': ['fg', 'Label'],
"   \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
" let g:fzf_history_dir = '~/.local/share/fzf-history'

" nnoremap <silent> <C-p> :Files<cr>
nnoremap <silent> <C-a> :Rg<cr>
let $FZF_DEFAULT_COMMAND = 'ag -g "" -U --path-to-ignore ~/.ignore'
" nnoremap <silent> <C-p> :call fzf#run({ 'source': 'ag -g "" -U --path-to-ignore ~/.ignore', 'sink': 'e', 'window': 'enew' })<cr>
nnoremap <silent> <C-p> :Files<cr>
nnoremap <silent> <C-b> :Buffers<cr>
nnoremap <silent> <C-o> :Commands<cr>

command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

command! -bang -nargs=? -complete=dir Files
\ call fzf#vim#files(<q-args>, {'window': { 'width': 0.8, 'height': 0.3, 'yoffset': 0.1, 'border': 'rounded' }, 'options': ['--layout=reverse', '--margin=1,2']})

command! -bang -nargs=? -complete=dir Buffers
\ call fzf#vim#buffers({'window': { 'width': 0.4, 'height': 0.3, 'xoffset': 0.5, 'border': 'rounded' }, 'options': ['--layout=reverse', '--margin=1,2']})

command! -bang -nargs=? -complete=dir Commands
\ call fzf#vim#commands({'window': { 'width': 0.4, 'height': 0.3, 'xoffset': 0.5, 'border': 'rounded' }, 'options': ['--layout=reverse', '--margin=1,2']})

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({'window': { 'width': 0.9, 'height': 0.9, 'xoffset': 0.5, 'border': 'rounded' }, 'options': ['--layout=reverse', '--margin=1,2']}), <bang>0)


















" command! -bang -nargs=? -complete=dir Files
" \ call fzf#vim#files(<q-args>, {'options': ['--info=inline']}, <bang>0)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN: Vdebug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mapping '/remote/path' : '/local/path'
let g:vdebug_options = {}
let g:vdebug_options.path_maps = {
      \  '/var/www/ch.migros.karriere/web' : '/home/dulnan/development/ch.migros.karriere/web',
      \  '/var/www/oris-web' : '/home/dulnan/development/oris-web',
      \  '/var/www/oris-web/docroot' : '/home/dulnan/development/oris-web/docroot',
      \  '/var/www/zuerich.com' : '/home/dulnan/development/zuerich.com',
      \  '/var/www/zuerich.com/docroot' : '/home/dulnan/development/zuerich.com/docroot',
      \  '/var/www/asvz/web' : '/home/dulnan/development/asvz.ch-next/web',
      \  '/var/www/shkb' : '/home/dulnan/development/shkb.next',
      \  '/var/www/shkb/docroot' : '/home/dulnan/development/shkb.next/docroot',
      \}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN: JsDoc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! -register JsDoc call jsdoc#insert()
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_input_description = 1
let g:jsdoc_enable_es6 = 1


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
  execute 'argdo %s/'.search.'/'.replace.'/ge'
  set magic
endfunction

command SearchReplace call GlobalSearchReplace()

autocmd FileType c ClangFormatAutoEnable

let g:clang_format#style_options = {
            \ "ColumnLimit" : 120,
            \ "Standard" : "C++11"}




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCTION: Delete empty buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! DeleteEmptyBuffers()
    let [i, n; empty] = [1, bufnr('$')]
    while i <= n
        if bufexists(i) && bufname(i) == ''
            call add(empty, i)
        endif
        let i += 1
    endwhile
    if len(empty) > 0
        exe 'bdelete' join(empty)
    endif
endfunction
