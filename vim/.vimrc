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
set background=dark                 " set the background to dark
set t_Co=256                        " enable 256 color terminal
colorscheme gruvbox                 " set the color scheme
let g:gruvbox_contrast_dark = 'hard'
set clipboard=unnamedplus
set foldmethod=manual
set mouse=a
set spelllang=en_us
set nospell
set ruler
set laststatus=2
set cursorline

if (has("termguicolors"))
  set termguicolors
endif

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
"autocmd FileType vue syntax sync fromstart
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

augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

autocmd FileType vue syntax sync fromstart
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.scss

" Loads plugins def and config

" Start plugins definition
call plug#begin($HOME.'/.local/share/nvim/plugged')

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

Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }

Plug 'w0rp/ale'
Plug 'posva/vim-vue'
Plug 'pangloss/vim-javascript' , { 'for': ['javascript', 'javascript.jsx', 'html', 'vue'] }

Plug 'itchyny/lightline.vim'

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
"Plug 'heavenshell/vim-jsdoc'
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
let g:vue_disable_pre_processors=1

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
" 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


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
endif


" ALE
"let g:ale_sign_warning = '▲'
"let g:ale_sign_error = '✗'
"highlight link ALEWarningSign String
"highlight link ALEErrorSign Title




" Lightline
"let g:lightline = {
"\ 'colorscheme': 'Tomorrow_Night_Eighties',
"\ 'active': {
"\   'left': [['mode', 'paste'], ['filename', 'modified']],
"\   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
"\ },
"\ 'component_expand': {
"\   'linter_warnings': 'LightlineLinterWarnings',
"\   'linter_errors': 'LightlineLinterErrors',
"\   'linter_ok': 'LightlineLinterOK'
"\ },
"\ 'component_type': {
"\   'readonly': 'error',
"\   'linter_warnings': 'warning',
"\   'linter_errors': 'error'
"\ },
"\ }

"function! LightlineLinterWarnings() abort
  "let l:counts = ale#statusline#Count(bufnr(''))
  "let l:all_errors = l:counts.error + l:counts.style_error
  "let l:all_non_errors = l:counts.total - l:all_errors
  "return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
"endfunction

"function! LightlineLinterErrors() abort
  "let l:counts = ale#statusline#Count(bufnr(''))
  "let l:all_errors = l:counts.error + l:counts.style_error
  "let l:all_non_errors = l:counts.total - l:all_errors
  "return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
"endfunction

"function! LightlineLinterOK() abort
  "let l:counts = ale#statusline#Count(bufnr(''))
  "let l:all_errors = l:counts.error + l:counts.style_error
  "let l:all_non_errors = l:counts.total - l:all_errors
  "return l:counts.total == 0 ? '✓ ' : ''
"endfunction

"autocmd User ALELint call s:MaybeUpdateLightline()

"" Update and show lightline but only if it's visible (e.g., not in Goyo)
"function! s:MaybeUpdateLightline()
  "if exists('#lightline')
    "call lightline#update()
  "end
"endfunction



" status line always opened
"set laststatus=2

" [> EditorConfig <]

" to avoid issues with fugitive
"let g:EditorConfig_exclude_patterns = ['fugitive://.*']


"let g:deoplete#enable_at_startup = 1

"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


" [> Syntastic <]

"" Syntax checkers

"let g:syntastic_check_on_open=1
"let g:syntastic_enable_signs=1
"let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
"let g:syntastic_html_checkers=['tidy']
"let g:syntastic_vim_checkers=['vimlint']
"let g:syntastic_json_checkers=['jsonlint']
"let g:syntastic_yaml_checkers=['js-yaml']
"let g:syntastic_scss_checkers=['scss-lint']
"let g:syntastic_css_checkers=['csslint']
"let g:syntastic_handlebars_checkers=['handlebars']
"let g:syntastic_tpl_checkers=['handlebars']

"" get available js linters
"" it returns the mapping between a linter and the config files
"function! GetJslinters()
    "return {
    "\    'eslint' : [ '.eslintrc',  '.eslintrc.json',  '.eslintrc.js', '.eslint.yml' ],
    "\    'jshint' : [ '.jshintrc']
    "\ }
"endfunction

"" check if the path to see if a linter config is present
"function! Jslinter(path, linters)
    "let l:dir = fnamemodify(a:path, ':p:h')

    "if(l:dir == '/')
        "return ['']
    "endif

    "for l:linter in keys(a:linters)
        "for l:linterConfig in a:linters[l:linter]
            "if filereadable(l:dir . '/' . l:linterConfig)
                "let l:localLinter = l:dir . '/node_modules/.bin/' . l:linter
                "if executable(l:localLinter)
                    "return [l:linter, l:localLinter]
                "endif
                "return [l:linter, l:linter]
            "endif
        "endfor
    "endfor

    "return Jslinter(fnamemodify(l:dir, ':h'), a:linters)
"endfunction

"" set the jslinter into Syntastic
"function! SyntasticSetJsLinter()

    "let l:availableLinters = GetJslinters()

    "" look for linter config in the current folder
    "let l:jslinter = Jslinter(expand('%:p'), l:availableLinters)
    "if l:jslinter[0] == ''
        "" otherwise look into the home dir
        "let l:jslinter = Jslinter($HOME, l:availableLinters)
    "endif

    "" configure the linter
    "if l:jslinter[0] != ''
        "let g:syntastic_javascript_checkers=[l:jslinter[0]]
        "if l:jslinter[0] != l:jslinter[1]
            "exec 'let g:syntastic_javascript_' . l:jslinter[0] . '_exec = "' . l:jslinter[1] . '"'
        "endif
        "let g:syntastic_javascript_checkers=[l:jslinter[0]]
    "endif
"endfunction

"call SyntasticSetJsLinter()

"" [> EasyAlign <]

"" select paragraph and start easyalign on the left
"nnoremap <leader>a vip<Plug>(EasyAlign)<cr>

"" Start interactive align to the right
"vmap <leader>a <Plug>(EasyAlign)<cr><right>

"let g:easy_align_ignore_groups = ['Comment']


"" [> multiple cursor <]

"let g:multi_cursor_use_default_mapping=-2
"let g:multi_cursor_next_key='<C-m>'
"let g:multi_cursor_prev_key='<C-p>'
"let g:multi_cursor_skip_key='<C-x>'
"let g:multi_cursor_quit_key='<esc>'


"" [> JsBeautify <]

"" format selection
"autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
"autocmd FileType json vnoremap <buffer>  <c-f> :call RangeJsonBeautify()<cr>
"autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
"autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

"" format the whole file
"autocmd FileType javascript nnoremap <buffer>  <c-f> :call JsBeautify()<cr>
"autocmd FileType json nnoremap <buffer>  <c-f> :call JsonBeautify()<cr>
"autocmd FileType html nnoremap <buffer> <c-f> :call HtmlBeautify()<cr>
"autocmd FileType css nnoremap <buffer> <c-f> :call CSSBeautify()<cr>

"" [> YankStack <]

"nmap <leader>p <Plug>yankstack_substitute_older_paste
"nmap <leader>P <Plug>yankstack_substitute_newer_paste


"" [> Javascript libraries syntax <]

"let g:used_javascript_libs = 'jquery,underscore,requirejs,chai,handlebars'



"" [> YCM shortcuts <]
""
"function! Refactor()
    "call inputsave()
    "let g:newName = input("Enter the new variable name : ")
    "call inputrestore()
    "exec ":YcmCompleter RefactorRename " . g:newName
"endfunction

"nnoremap <leader>gt :YcmCompleter GetType<cr>
"nnoremap <leader>gd :YcmCompleter GetDoc<cr>
"nnoremap <leader>go :YcmCompleter GoTo<cr>
"nnoremap <leader>gf :YcmCompleter GoToDefinition<cr>
"nnoremap <leader>gr :YcmCompleter GoToReferences<cr>
"nnoremap <leader>r :call Refactor()<cr>

"" [> Emmet shortcuts <]
""
"au FileType html,css,scss imap <expr>kj  emmet#expandAbbrIntelligent("\<tab>")

"com! FormatJSON %!python -m json.tool
"

"let g:indent_guides_auto_colors = 0
"let g:indent_guides_auto_colors = 1
"


"let g:jsdoc_enable_es6=1
let g:used_javascript_libs = 'jquery,underscore,vue,handlebars'

"let g:javascript_plugin_jsdoc = 1



let g:vimDir = $HOME.'/.vim'

"let g:vdebug_options = {}
"let g:vdebug_options["port"] = 9000
"let g:vdebug_options["server"] = ''
"let g:vdebug_options['path_maps'] = {
      "\  '/var/www/ch.migros.karriere/web' : '/Users/dulnan/Development/ch.migros.karriere/web',
      "\  '/var/www/asvz/web' : '/home/dulnan/Development/asvz.ch-next/web',
      "\  '/vagrant/web' : '/Users/dulnan/Development/weddington-content/web',
      "\}




" NERD Commenter

"noremap <c-o> :call NERDComment(0, "Toggle")<cr>
"nmap <c-o> <plug>NERDCommenterToggle
"vmap <c-o> <plug>NERDCommenterToggle gv



"let g:ft = ''
"fu! NERDCommenter_before()
  "if &ft == 'vue'
    "let g:ft = 'vue'
    "let stack = synstack(line('.'), col('.'))
    "if len(stack) > 0
      "let syn = synIDattr((stack)[0], 'name')
      "if len(syn) > 0
        "let syn = tolower(syn)
        "exe 'setf '.syn
      "endif
    "endif
  "endif
"endfu
"fu! NERDCommenter_after()
  "if g:ft == 'vue'
    "setf vue
    "g:ft
  "endif
"endfu

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

"let g:indent_guides_enable_on_vim_startup = 1

