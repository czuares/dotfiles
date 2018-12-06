" Airline
let g:airline_theme='minimalist'

" NERDTree
" let g:NERDTreeMinimalUI = 1
let g:NERDTreeWinSize = 25
" let g:NERDTreeCascadeOpenSingleChildDir = 1
" let g:NERDTreeCascadeSingleChildDir = 0
let g:NERDTreeShowHidden = 1
let g:NERDTreeRespectWildIgnore = 0
let g:NERDTreeAutoDeleteBuffer = 0
" let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeHijackNetrw = 1
let NERDTreeIgnore = [
	\ '\.git$', '\.hg$', '\.svn$', '\.stversions$', '\.pyc$', '\.svn$',
	\ '\.DS_Store$', '\.sass-cache$', '__pycache__$', '\.egg-info$', '\.cache$'
	\ ]
map <silent> <leader>nn :NERDTreeToggle<cr>
map <silent> <leader>nf :NERDTreeFocus<cr>

" Terraform
let g:terraform_fmt_on_save=1

" Markdown
let vim_markdown_preview_hotkey='<silent><C-m>'
let vim_markdown_preview_browser='Google Chrome'

" Gundo
let g:gundo_prefer_python3 = 1

" Ack
let g:ackprg = 'ag --vimgrep --smart-case' " use ag

" Markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0

" CtrlP
" let g:ctrlp_cmd = 'CtrlPBuffer'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|terraform)$'
let g:ctrlp_working_path_mode = 'a'

" UltiSnips
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" Committia
let g:committia_hooks = {}
function! g:committia_hooks.edit_open(info)
    setlocal spell

    if a:info.vcs ==# 'git' && getline(1) ==# ''
        startinsert
    end

    imap <buffer><C-n> <Plug>(committia-scroll-diff-down-half)
    imap <buffer><C-p> <Plug>(committia-scroll-diff-up-half)
endfunction

" Edgemotion
map <C-j> <Plug>(edgemotion-j)
map <C-k> <Plug>(edgemotion-k)

" Bookmarks
nmap <Leader><Leader> <Plug>BookmarkToggle
nmap <Leader>i <Plug>BookmarkAnnotate
nmap <Leader>a <Plug>BookmarkShowAll
nmap <Leader>j <Plug>BookmarkNext
nmap <Leader>k <Plug>BookmarkPrev
nmap <Leader>c <Plug>BookmarkClear
nmap <Leader>x <Plug>BookmarkClearAll
nmap <Leader>kk <Plug>BookmarkMoveUp
nmap <Leader>jj <Plug>BookmarkMoveDown
nmap <Leader>g <Plug>BookmarkMoveToLine

" choosewin
nmap - <Plug>(choosewin)

" Easyescape
let g:easyescape_chars = { "j": 1, "k": 1 }
let g:easyescape_timeout = 100
cnoremap jk <ESC>
cnoremap kj <ESC>

" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" let g:airline#extensions#clock#format = '%I:%M %p'
" let g:airline#extensions#clock#updatetime = 60000

" Rainbow
let g:rainbow_active = 1

" CtrlSF
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>
