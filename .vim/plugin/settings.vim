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

" " Folding
" set foldmethod=syntax
" set foldnestmax=10
" set nofoldenable
" set foldlevel=2

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

" Color fixes
set termguicolors
" https://github.com/vim/vim/issues/993
" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Colorscheme
set background=dark
" colorscheme one
" colorscheme onedark
" colorscheme gotham256
" colorscheme PaperColor
" colorscheme srcery
try
  " colorscheme hybrid_material
  colorscheme nord
catch
  " ignore
endtry
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

" Set gotmpl to helm
autocmd BufRead,BufNewFile *.gotmpl set filetype=helm

" CHange tf linters because of https://github.com/dense-analysis/ale/issues/2762
" autocmd BufRead,BufNewFile *.tf let b:ale_linters = { 'terraform': ['terraform'] }

" close vim if nerdtree is only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" " change dir to opened buffer
" autocmd BufEnter * silent! lcd %:p:h

" Strip whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" fzf (brew installed)
set rtp+=/usr/local/opt/fzf



" Automatic paste
" https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
