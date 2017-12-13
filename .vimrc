set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'python-mode/python-mode'
Plugin 'scrooloose/nerdtree'
Plugin 'ryanoasis/vim-webdevicons'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'tpope/vim-fugitive'
Plugin 'Shougo/deoplete.nvim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'majutsushi/tagbar'
Plugin 'haya14busa/incsearch.vim'
Plugin 'jaxbot/browserlink.vim'
Plugin 'shime/vim-livedown'

call vundle#end()            " required
filetype plugin indent on    " required

" General settings
set nu
set t_Co=256
set mouse=a
set encoding=utf-8
highlight LineNr ctermbg=8
highlight BadWhitespace ctermbg=red guibg=red

" AirLine settings
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline_powerline_fonts=1

" Tabs / Buffers settings
tab sball
set switchbuf=useopen
set laststatus=2
nmap <F8> :TagbarToggle<CR>
nmap <F9> :bprev<CR>
nmap <F10> :bnext<CR>
nmap <silent> <leader>q :SyntasticCheck # <CR> :bp <BAR> bd #<CR>

" incsearch.vim settings.
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map <F6> :LivedownToggle<CR>

" grip setting (markdown reader) 
" let vim_markdown_preview_github=1

" Search settings
set incsearch	                            " incremental search
set hlsearch	                            " highlight search results

" NERDTree settings
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
let NERDTreeShowHidden=1
let python_highlight_all=1
syntax on

" autostart nerdtree
autocmd vimenter * NERDTree
" autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" open NERDtree with <ctrl-n>
map <C-n> :NERDTreeToggle<CR>

" close nerdtree if all windows are closed
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" yaml files
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" *.py files 
autocmd BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix colorcolumn=120

" *.js, *.html, *.css files
autocmd BufNewFile,BufRead *.js,*.html,*.css set tabstop=2 softtabstop=2 shiftwidth=2

" Mark BadWhiteSpace
autocmd BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

au FileType qf setlocal nonumber colorcolumn=
let g:pymode_options_max_line_length=120
let g:syntastic_python_pylint_post_args="--max-line-length=120"
