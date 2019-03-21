" Customizations
let mapleader = "\<Space>"

" Save shortcut
nmap <silent> <leader>w :wa!<cr>

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Useful mappings for managing tabs
map <leader>nt :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tp :tabprev<cr>
map <leader>tm :tabmove 

" CloseBuffers settings
nnoremap <silent> <leader>q :CloseBuffersMenu<CR>

" Vim hard mode :)
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Reformat file
map <leader>gg gg=G''

" Format JSON helper
com! FormatJSON %!python -m json.tool
