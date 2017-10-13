set nocompatible              " be iMproved, required
let g:python_host_prog = '{{ pillar['pyenvs']['default_version']['path'] }}/bin/python'

{% for version in pillar['pyenvs']['extra_versions'] %}
let g:python3_host_prog = '{{ version['path'] }}/bin/python'
{% endfor %}

call plug#begin('~/.local/share/nvim/plugged')

" Plugins! So many plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rking/ag.vim'
Plug 'tweekmonster/braceless.vim'
Plug 'flazz/vim-colorschemes'
Plug 'kien/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go'
Plug 'sjl/gundo.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'terryma/vim-multiple-cursors'
Plug 'mhartington/nvim-typescript', { 'do': ':UpdateRemotePlugins' }
Plug 'leafgarland/typescript-vim'
Plug 'lambdalisue/vim-pyenv'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'saltstack/salt-vim'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'hashivim/vim-terraform'
Plug 'tpope/vim-unimpaired'

" Order matters for some plugins...
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
call plug#end()


" And my default settings
" Magic vim settings
syn on
set nu
set backspace=indent,eol,start
set hlsearch
colorscheme 256-grayvim
nmap <silent> <leader>uL :t.<CR>Vr=
nmap <silent> <leader>ul :t.<CR>Vr-
nmap <silent> <leader>h :nohls<CR>

" Braceless
autocmd FileType python,yaml BracelessEnable +indent

" CtrlP
if executable('ag')
  " Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast, respects .gitignore
  " and .agignore. Ignores hidden files by default.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -f -g ""'
else
  "ctrl+p ignore files in .gitignore
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
endif

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#show_docstring = 1
call deoplete#custom#set('jedi', 'rank', 900)  " Sort Jedi suggestions higher
autocmd InsertLeave * if pumvisible() == 0 | pclose | endif

augroup omnifuncs
  autocmd!
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
augroup end

function! Multiple_cursors_before()
  call deoplete#disable()
endfunction
function! Multiple_cursors_after()
  call deoplete#enable()
endfunction
" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']


" Fugitive
nmap <leader>gd :Gdiff<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gl :Glog<CR>

" GUndo
nnoremap <F5> :GundoToggle<CR>

" NerdCommenter
map <leader>/ <plug>NERDCommenterToggle<CR>

" NerdTree
let NERDTreeWinSize = 45
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.rbo$', '\.class$', '\.o$', '\~$', '__pycache__$[[dir]]']
map <leader>n :NERDTreeToggle<CR>
map <leader>N :NERDTreeFind<CR>

" Set clipboard last since OSX seems to be having trouble with this...
set clipboard=unnamed
