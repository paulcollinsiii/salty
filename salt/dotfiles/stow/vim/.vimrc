set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins! So many plugins
Plugin 'rking/ag.vim'
Plugin 'pearofducks/ansible-vim'
Plugin 'tweekmonster/braceless.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'flazz/vim-colorschemes'
Plugin 'wincent/command-t'
Plugin 'easymotion/vim-easymotion'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'lambdatoast/elm.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'sjl/gundo.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'lambdalisue/vim-pyenv'
Plugin 'elzr/vim-json'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'endel/vim-github-colorscheme'
Plugin 'nanotech/jellybeans.vim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'hashivim/vim-terraform'
Plugin 'saltstack/salt-vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'tpope/vim-unimpaired'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'drn/zoomwin-vim'

" Order matters for some plugins...
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


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

" Command-T
nmap <silent> <C-P> :CommandT<CR>

" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" Elm
let g:elm_format_autosave = 1

" Fugitive
nmap <leader>gd :Gdiff<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gl :Glog<CR>

" GUndo
nnoremap <F5> :GundoToggle<CR>

" Jedi
let g:jedi#show_call_signatures = 2
let g:jedi#show_call_signature_delay = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#use_splits_not_buffers = "bottom"
let g:jedi#max_doc_height = 45
let g:jedi#usages_command = ""

" vim-pyenv
if jedi#init_python()
    function! s:jedi_auto_force_py_version() abort
        let major_version = pyenv#python#get_internal_major_version()
        call jedi#force_py_version(major_version)
    endfunction
    augroup vim-pyenv-custom-augroup
        au! *
        au User vim-pyenv-activate-post   call s:jedi_auto_force_py_version()
        au User vim-pyenv-deactivate-post call s:jedi_auto_force_py_version()
    augroup END
endif


" NerdCommenter
map <leader>/ <plug>NERDCommenterToggle<CR>

" NerdTree
let NERDTreeWinSize = 45
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.rbo$', '\.class$', '\.o$', '\~$', '__pycache__$[[dir]]']
map <leader>n :NERDTreeToggle<CR>
map <leader>N :NERDTreeFind<CR>

" Powerline
{% if grains['os'] == 'Ubuntu' %}
py3 from powerline.vim import setup as powerline_setup
py3 powerline_setup()
py3 del powerline_setup
{% else %}
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
{% endif %}

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" unimpaired mappings
nmap <C-k> [e
nmap <C-j> ]e
