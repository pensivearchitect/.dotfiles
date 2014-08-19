" Sane Defaults
filetype off
call pathogen#infect()
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
syntax on
filetype plugin indent on
set nocompatible
set ai
set copyindent
set magic
set autochdir
set modelines=0
set encoding=utf-8
set showcmd
set ttyfast
set ruler
set nonumber
set norelativenumber
set noswapfile
set list
set listchars=tab:▸\ ,extends:❯,precedes:❮
set lazyredraw
set shiftround
set linebreak
set matchtime=3
set undofile
set undodir=/Users/joshua/.vim/undo
set undolevels=1000
set undoreload=10000
set ttimeoutlen=50
set laststatus=2
set tags+=gem.tags
set tags+=stdlib.tags
set tags+=tags
set dictionary+=/Users/home/joshua/.autocomplete_ruby/tags
set backspace=indent,eol,start
set autowrite
set complete=.,w,b,u,t
set sessionoptions+=buffers
" set completeopt=longest,menuone,preview
au VimResized * :wincmd =
" Smart Searching
set ignorecase
set smartcase
set smartindent
set hlsearch
set incsearch
set wrap
set wildmode=longest,list
set wildignorecase
" Better tabbing
set tabstop=2
set shiftwidth=2
set expandtab
" Color Settings
set background=dark
set t_Co=256
set viminfo="10,\"100,:20,%,n~/.viminfo"
hi Normal ctermfg=white ctermbg=black
" colorscheme tomorrow-night-bright
let mapleader = " "
" Calling plugin managers
highlight Pmenu ctermfg=0, ctermbg=15, guibg=black
" }}} |BundlePlugin|
" Global Settings
au FocusLost * silent! wa
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
runtime macros/matchit.vim
let b:surround_indent = 1
let g:syntastic_cpp_compiler_options = " -std=c++11"
let g:syntastic_echo_current_error=1
let g:syntastic_enable_signs=1
let g:syntastic_enable_highlighting = 1
let g:syntastic_check_on_open=1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
highlight SyntasticErrorSign ctermfg=1
let g:syntastic_always_populate_loc_list = 1
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:unite_enable_start_insert = 1
let g:unite_winheight = 10
let g:unite_split_rule = "botright"
let g:unite_force_overwrite_statusline = 0
let g:unite_source_grep_max_candidates = 1000
let g:bufferline_echo = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_refresh_always = 1
let g:ycm_collect_identifiers_from_comments_and_string = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py"
let g:airline_powerline_fonts = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
let VimuxUseNearest = 1
let g:rspec_command = "compiler rspec | set makeprg=zeus | Make rspec {spec}"
let g:tabman_number = 0
let g:rbpt_colorpairs = [
      \ ["brown",       "RoyalBlue3"],
      \ ["Darkblue",    "SeaGreen3"],
      \ ["darkgray",    "DarkOrchid3"],
      \ ["darkgreen",   "firebrick3"],
      \ ["darkcyan",    "RoyalBlue3"],
      \ ["darkred",     "SeaGreen3"],
      \ ["darkmagenta", "DarkOrchid3"],
      \ ["brown",       "firebrick3"],
      \ ["gray",        "RoyalBlue3"],
      \ ["black",       "SeaGreen3"],
      \ ["darkmagenta", "DarkOrchid3"],
      \ ["Darkblue",    "firebrick3"],
      \ ["darkgreen",   "RoyalBlue3"],
      \ ["darkcyan",    "SeaGreen3"],
      \ ["darkred",     "DarkOrchid3"],
      \ ["red",         "firebrick3"],
      \ ]
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
" |Filetype| settings
au BufNewFile,BufRead *.m*down setlocal filetype=markdown foldlevel=1
autocmd FileType ruby let g:rubycomplete_buffer_loading=1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby let g:rubycomplete_classes_in_global=1
autocmd Filetype ruby let g:rubycomplete_use_bundler = 1
autocmd FileType ruby  let g:rubycomplete_include_object = 1
autocmd FileType ruby  let g:rubycomplete_include_objectspace = 1
autocmd Filetype ruby  let g:EclimCompletionMethod = 'omnifunc'
autocmd Filetype scala let g:EclimCompletionMethod = 'omnifunc'
autocmd Filetype php   let g:EclimCompletionMethod = 'omnifunc'
let b:EclimPhpHtmlValidate = 1
let g:EclimCompletionMethod = 'omnifunc'
autocmd Filetype java nnoremap <leader> t :Mvn compile
autocmd Filetype java nnoremap <leader> p :Mvn package
autocmd Filetype java nnoremap <leader> e :Mvn eclipse:eclipse
autocmd Filetype java nnoremap <leader> g :JavaGet
autocmd Filetype java nnoremap <leader> s :JavaSet
autocmd Filetype java nnoremap <leader> co :JavaConstructor
autocmd Filetype java nnoremap <leader> rn :JavaRename
au BufReadPost *.md set filetype=markdown
au Filetype haskell nnoremap <buffer> <leader>t :HdevtoolsType<cr>
au Filetype haskell nnoremap <buffer> <silent> <leader>c :HdevtoolsClear<cr>
autocmd Filetype javascript let g:tern_show_argument_hints="on_move"
au      BufNewFile, BufRead *.es6 set filetype=javascript
" |Remappings|
if executable("ag")
  set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ follow
  set grepformat=%f:%1:%c5m
  let g:unite_source_grep_command="ag"
  let g:unite_source_grep_default_opts="--nocolor --nogroup -S -C4"
  let g:unite_source_grep_recursive_opt=""

endif
call unite#custom#profile('files', 'update-time', 10)
call unite#filters#matcher_default#use(["matcher_fuzzy"])
nmap <leader>g g;
nmap <leader>s :A<cr>
nmap <cr> :call VimuxRunCommand("clear; zeus rspec `pwd`/" . bufname("%"))<cr>
nnoremap gld :%s/\s\+$// <cr>
nnoremap j gj
nnoremap k gk
nnoremap ]j :tabnext <cr>
nnoremap ]k :tabprevious <cr>
nnoremap <leader>j :tabprevious <cr>
nnoremap <leader>k :tabnext <cr>
nnoremap gsh :wincmd h <cr>
nnoremap gsl :wincmd l <cr>
nnoremap gst :Tabularize /
nnoremap chs :ChangeHashSyntax <cr>
nnoremap <F1> :NERDTreeToggle <cr>
nnoremap <F3> :NERDTreeToggle <cr> :TagbarToggle <cr>
nnoremap <F2> :TMToggle <cr>
nnoremap <leader>f :UniteWithProjectDir file_rec/async -start-insert<cr>
nnoremap <leader>t :UniteWithProjectDir file_rec/async -start-insert -auto-preview<cr>
nnoremap zO zCzO
inoremap <D-Enter> <Esc>o
inoremap {<cr> {<cr>}<c-o>O<tab>
inoremap [<cr> [<cr>]<c-o>O<tab>
inoremap (<cr> (<cr>)<c-o>O<tab>)]}
" https://gist.github.com/sjl/3762227
onoremap an :<c-u>call <SID>NextTextObject("a", "f")<cr>
xnoremap an :<c-u>call <SID>NextTextObject("a", "f")<cr>
onoremap in :<c-u>call <SID>NextTextObject("i", "f")<cr>
xnoremap in :<c-u>call <SID>NextTextObject("i", "f")<cr>

onoremap al :<c-u>call <SID>NextTextObject("a", "F")<cr>
xnoremap al :<c-u>call <SID>NextTextObject("a", "F")<cr>
onoremap il :<c-u>call <SID>NextTextObject("i", "F")<cr>
xnoremap il :<c-u>call <SID>NextTextObject("i", "F")<cr>
map <leader>p :call VimuxRunCommand("rails console")<cr>
vmap <leader>v "vy :call VimuxSlime()<cr>
nmap <leader>v vip<localleader>vs<cr>
" |Helpers|
function! VimuxSlime()
  call VimuxSendText(@v)
  call VimuxSendKeys("Enter")
endfunction
" Allows for surround.vim functionality, but from anywhere on the line
function! s:NextTextObject(motion, dir)
  let c = nr2char(getchar())
  if c ==# "b"
    let c = "("
  elseif c ==# "B"
    let c = "{"
  elseif c ==# "r"
    let c = "["
  endif
  exe "normal! ".a:dir.c."v".a:motion.c
endfunction

" set clipboard=unnamed
if has("gui_running")
  set go-=T
  set go-=l
  set go-=L
  set go-=r
  set go-=R
  " set guicursor=n-c:ver30-iCursor
  " set guicursor+=v:ver30-iCursor
  " set guicursor+=i-ci:ver30-iCursor
  colorscheme base16-default
  if has("gui_macvim")
    set guioptions+=c
    set macmeta
    macmenu &File.New\ Tab key=<nop>
    " let g:UltiSnipsExpandTrigger="<C-CR>"

    " imap  <C-p><C-C><Plug>PeepOpen
    " cmap <C-p> <C-C><Plug>PeepOpen
    " vmap <C-p> <C-C><Plug>PeepOpen

    " macmenu &File.New\ Tab key=<D-S-t>
  endif
else
  colorscheme base16-monokai
endif
let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

nnoremap gvd :Gdiff
nnoremap <silent> <C-W>z :wincmd z<Bar>cclose<Bar>lclose<CR>
let g:slime_target = "tmux"
augroup line_return
  au!
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END
