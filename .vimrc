if empty(glob('~/.vim/autoload/plug.vim'))
    silent execute "!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'sheerun/vim-polyglot'
Plug 'myusuf3/numbers.vim'
Plug 'w0rp/ale'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ryanoasis/vim-devicons'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'yggdroot/indentline'
Plug 'airblade/vim-gitgutter'
Plug 'towolf/vim-helm'
Plug 'hashivim/vim-terraform'
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'mileszs/ack.vim'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sjl/gundo.vim'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'plasticboy/vim-markdown'
Plug 'Asheq/close-buffers.vim'
Plug 'svermeulen/vim-easyclip'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'andrewradev/linediff.vim'
Plug 'haya14busa/vim-edgemotion'
Plug 'mattesgroeger/vim-bookmarks'
Plug 'rhysd/committia.vim'
Plug 'junegunn/vim-peekaboo'
Plug 't9md/vim-choosewin'
Plug 'tyru/open-browser.vim'
Plug 'tyru/open-browser-github.vim'
Plug 'dkprice/vim-easygrep'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'cwood/ultisnips-terraform-snippets'
Plug 'saltstack/salt-vim'
Plug 'stephpy/vim-yaml'
Plug 'terryma/vim-multiple-cursors'
Plug 'prakashdanish/vim-githubinator'
Plug 'luochen1990/rainbow'
Plug 'junegunn/fzf'
Plug 'RRethy/vim-illuminate'
Plug 'gu-fan/simpleterm.vim'
Plug 'dyng/ctrlsf.vim'
call plug#end()

" Plug 'jeanCarloMachado/vim-toop'
" Plug 'thaerkh/vim-workspace'
" Plug 'bagrat/vim-workspace'
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'andymass/vim-tradewinds'
" Plug 'mhinz/vim-signify'
" Plug 'fielding/vim-chunkwm-navigator'
" Plug 'zhou13/vim-easyescape'
" Plug 'junegunn/vim-plug'
" Plug 'haya14busa/vim-asterisk'
" Plug 'junegunn/vim-easy-align'
" Plug 'benmills/vimux'
" Plug 'bling/vim-bufferline'
" Plug 'brooth/far.vim'
" Plug 'danro/rename.vim'
" Plug 'docker/docker'
" Plug 'easymotion/vim-easymotion'
" Plug 'edkolev/promptline.vim'
" Plug 'edkolev/tmuxline.vim'
" Plug 'ekalinin/dockerfile.vim'
" Plug 'elzr/vim-json'
" Plug 'enricobacis/vim-airline-clock'
" Plug 'ervandew/supertab'
" Plug 'j5shi/ctrlp_bdelete.vim'
" Plug 'jarrodctaylor/vim-shell-executor'
" Plug 'jistr/vim-nerdtree-tabs'
" Plug 'jreybert/vimagit'
" Plug 'kien/tabman.vim'
" Plug 'maxbrunsfeld/vim-yankstack'
" Plug 'mhinz/vim-startify'
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'ntpeters/vim-better-whitespace'
" Plug 'plytophogy/vim-virtualenv'
" Plug 'raimondi/delimitmate'
" Plug 'roxma/vim-hug-neovim-rpc'
" Plug 'roxma/vim-paste-easy'
" Plug 'scrooloose/nerdcommenter'
" Plug 'scrooloose/syntastic'
" Plug 'shougo/deoplete.nvim'
" Plug 'shougo/vimproc.vim'
" Plug 'terryma/vim-expand-region'
" Plug 'terryma/vim-multiple-cursors'
" Plug 'thaerkh/vim-workspace'
" Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-unimpaired'
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-session'
" Plug 'yuttie/comfortable-motion.vim'
" Plug 'mhinz/vim-startify'
