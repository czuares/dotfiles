" Share clipboard with host
set clipboard=unnamed

" Disable startup message
set shortmess=I

set incsearch                   " incremental searching
set showmatch                   " show pairs match
set hlsearch                    " highlight search results
set smartcase                   " smart case ignore
set ignorecase                  " ignore case letters

set lazyredraw " Don't redraw while executing macros (good performance config)
set magic " For regular expressions turn magic on
set cursorline

" Tabs, text
set expandtab " Use spaces instead of tabs
" set shiftwidth=4 " 1 tab == 4 spaces
" set tabstop=4
set shiftwidth=0
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Undo
set undofile                " Save undos after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

" Colorscheme
set background=dark
" colorscheme one
" colorscheme orbital
colorscheme hybrid_material
" colorscheme zenburn peaksea janah onedark
" autocmd ColorScheme janah highlight Normal ctermbg=235


" Automatically resize
autocmd VimResized * wincmd =

" Fast reload vimrc
autocmd! bufwritepost .vimrc source %

" Autodetect new file type
autocmd BufEnter * if &filetype == "" | setlocal filetype=detect | endif

" Set spell for markdown
autocmd FileType markdown setlocal spell

" close vim if nerdtree is only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" " change dir to opened buffer
" autocmd BufEnter * silent! lcd %:p:h

" fzf (brew installed)
set rtp+=/usr/local/opt/fzf
