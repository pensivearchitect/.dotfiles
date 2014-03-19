" Sane Defaults
filetype off
call pathogen#infect()
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
syntax on
filetype plugin indent on
call vundle#rc()
set nocompatible
set ai
set copyindent
set magic
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
set backspace=indent,eol,start
set autowrite
set complete=.,w,b,u,t
set completeopt=longest,menuone,preview
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
hi Normal ctermfg=white ctermbg=black
" colorscheme tomorrow-night-bright
let mapleader = " "
" Calling plugin managers
set rtp+=~/.vim/bundle/vundle
highlight Pmenu ctermfg=0, ctermbg=15, guibg=black
" Installed Plugins, the true sign of an experienced vim addict^W user 
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-rake'
Bundle 'pangloss/vim-javascript'
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'
Bundle 'tpope/vim-haml'
Bundle 'marijnh/tern_for_vim'
Bundle 'tpope/vim-bundler'
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'juvenn/mustache.vim'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'vim-scripts/dbext.vim'
Bundle 'benmills/vimux'
Bundle 'terryma/vim-multiple-cursors' 
Bundle 'kchmck/vim-coffee-script'
Bundle 'dsawardekar/portkey'
Bundle 'dsawardekar/ember.vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'vim-ruby/vim-ruby'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/rainbow_parentheses.vim'
" Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-rbenv'
Bundle 'itchyny/lightline.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/unite.vim'
Bundle 'bitc/vim-hdevtools'
Bundle 'vim-scripts/Superior-Haskell-Interaction-Mode-SHIM'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
" Bundle "garbas/vim-snipmate"
" Bundle 'honza/vim-snippets'
Bundle 'lukerandall/haskellmode-vim'
Bundle 'derekwyatt/vim-scala'
Bundle 'thoughtbot/vim-rspec'
Bundle 'heartsentwined/vim-ember-script'
Bundle 'chriskempson/base16-vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'SirVer/ultisnips'
Bundle 'Blackrush/vim-gocode'
Bundle 'Shougo/vimshell.vim'
" Global Settings
au FocusLost * silent! wa
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
" Paragraph text objects for ruby 
runtime macros/matchit.vim
" Plugin settings 
let b:surround_indent = 1
let g:syntastic_cpp_compiler_options = ' -std=c++11'
" let g:syntastic_echo_current_error=1
" let g:syntastic_enable_signs=1
" let g:syntastic_enable_highlighting = 1
" let g:syntastic_check_on_open=1
" let g:syntastic_error_symbol = '✗'
" let g:syntastic_warning_symbol = '⚠'
" highlight SyntasticErrorSign ctermfg=1 
" let g:syntastic_always_populate_loc_list = 1
" let g:nerdtree_tabs_open_on_gui_startup = 0
let g:unite_enable_start_insert = 1
let g:unite_winheight = 10
let g:unite_split_rule = 'botright'
let g:unite_force_overwrite_statusline = 0
let g:multi_cursor_exit_from_insert_mode = 0
let g:multi_cursor_exit_from_visual_mode = 0
let g:bufferline_echo = 0
let g:ycm_collect_identifiers_from_comments_and_string = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:rspec_command = "VimuxRunCommand( spring rspec { spec } )"
let VimuxUseNearestPane = 1
if executable('coffeetags')
  " let g:tagbar_type_coffee = {
  "       \ 'ctagsbin' : 'coffeetags',
  "       \ 'ctagsargs' : '',
  "       \ 'kinds' : [
  "       \ 'f:functions',
  "       \ 'o:object',
  "       \ ],
  "       \ 'sro' : .,
  "       \ 'kind2scope' : {
  "       \ 'f' : 'object',
  "       \ 'o' : 'object',
  "       \ }
  "       \ }
endif
" let g:lightline = {
" \ 'component': {
" \   'readonly': '%{&readonly? LOCKED :}',
" \ },
" \ }

let g:rbpt_colorpairs = [
      \ ['brown',       'RoyalBlue3'],
      \ ['Darkblue',    'SeaGreen3'],
      \ ['darkgray',    'DarkOrchid3'],
      \ ['darkgreen',   'firebrick3'],
      \ ['darkcyan',    'RoyalBlue3'],
      \ ['darkred',     'SeaGreen3'],
      \ ['darkmagenta', 'DarkOrchid3'],
      \ ['brown',       'firebrick3'],
      \ ['gray',        'RoyalBlue3'],
      \ ['black',       'SeaGreen3'],
      \ ['darkmagenta', 'DarkOrchid3'],
      \ ['Darkblue',    'firebrick3'],
      \ ['darkgreen',   'RoyalBlue3'],
      \ ['darkcyan',    'SeaGreen3'],
      \ ['darkred',     'DarkOrchid3'],
      \ ['red',         'firebrick3'],
      \ ]
" Ruby/Rails Setup
autocmd FileType ruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby let g:rubycomplete_buffer_loading=1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby let g:rubycomplete_classes_in_global=1
autocmd filetype ruby let g:rubycomplete_use_bundler = 1
autocmd FileType ruby let g:rubycomplete_include_object = 1
autocmd FileType ruby let g:rubycomplete_include_objectspace = 1
autocmd Filetype ruby let g:EclimCompletionMethod = 'omnifunc'
autocmd Filetype java let g:EclimCompletionMethod = 'omnifunc'
autocmd Filetype scala let g:EclimCompletionMethod = 'omnifunc'
autocmd Filetype java nnoremap <leader> c :Mvn compile
" Hackage
au Filetype haskell nnoremap <buffer> <leader>t :HdevtoolsType<cr>
au Filetype haskell nnoremap <buffer> <silent> <leader>c :HdevtoolsClear<cr>
" Js stuff
autocmd Filetype javascript let g:tern_show_argument_hints='on_move'
" Make NERDTree behave properly 
" Remappings
nmap <F2> :TagbarToggle <cr>
inoremap <D-Enter> <Esc>o
" map <leader>p :call VimuxRunCommand("pry")<cr>
function! VimuxSlime()
  call VimuxSendText(@v)
  call VimuxSendKeys("Enter")
endfunction
vmap <localleader>vs "vy :call VimuxSlime"
nmap <localleader>vs vip<localleader>vs<cr>
if executable('ag')
  set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ follow
  set grepformat=%f:%1:%c5m
  let g:unite_source_grep_command='ag'
  let g:unite_source_grep_default_opts='--nocolor --nogroup -S -C4'
  let g:unite_source_grep_recursive_opt=''

endif
call unite#filters#matcher_default#use(['matcher_fuzzy'])

" nnoremap <c-p> :Unite file_rec/async -start-insert <cr> 
" So mind blowinly awesome that this is Shamelessly(tm) stolen from 
" https://gist.github.com/sjl/3762227
" Allows for surround.vim functionality, but from anywhere on the line
onoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
xnoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
onoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>
xnoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>

onoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
xnoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
onoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>
xnoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>

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

nnoremap zO zCzO
" set clipboard=unnamed
if has('gui_running')
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
    macmenu &File.New\ Tab key=<nop>
    map  <C-p> <Plug>PeepOpen
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
set t_Co=256
au BufReadPost *.md set filetype=markdown
set viminfo='10,\"100,:20,%,n~/.viminfo'
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
inoremap {<cr> {<cr>}<c-o>O<tab>
inoremap [<cr> [<cr>]<c-o>O<tab>
inoremap (<cr> (<cr>)<c-o>O<tab>)]}
" imap = ;g ":UltiSnipsExpandTrigger"
    " let g:UltiSnipsJumpForwardTrigger = <leader>n
    " let g:UltiSnipsJumpBackwardTrigger = <leader>p
 
