set nocompatible              " be iMproved, required
let g:python_host_prog = '{{ pillar['pyenvs']['default_version']['path'] }}/bin/python'

{% for version in pillar['pyenvs']['extra_versions'] %}
let g:python3_host_prog = '{{ version['path'] }}/bin/python'
{% endfor %}

call plug#begin('~/.vim/plugged')

" Plugins! So many plugins
Plug 'vim-airline/vim-airline'
Plug 'rking/ag.vim'
Plug 'tweekmonster/braceless.vim'
Plug 'flazz/vim-colorschemes'
Plug 'wincent/command-t'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go'
Plug 'sjl/gundo.vim'
Plug 'terryma/vim-multiple-cursors'
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
set clipboard=unnamed
set backspace=indent,eol,start
set hlsearch
colorscheme 256-grayvim
nmap <silent> <leader>uL :t.<CR>Vr=
nmap <silent> <leader>ul :t.<CR>Vr-
nmap <silent> <leader>h :nohls<CR>

" Braceless
autocmd FileType python,yaml BracelessEnable +indent

" Command-T
nmap <silent> <C-P> :CommandT<CR>

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
