if empty(glob('~/.vim/autoload/plug.vim'))
    silent execute "!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Core
Plug 'tpope/vim-sensible'
Plug 'sheerun/vim-polyglot'
Plug 'myusuf3/numbers.vim'
Plug 'w0rp/ale'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'ervandew/supertab'
" UI
Plug 'ryanoasis/vim-devicons'
Plug 'flazz/vim-colorschemes'
" Plug 'arcticicestudio/nord-vim'
" Plug 'rakr/vim-one'
" Plug 'fcpg/vim-orbital'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'yggdroot/indentline'
Plug 'luochen1990/rainbow'
Plug 'RRethy/vim-illuminate'
" NerdTree
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
" Session
Plug 'tpope/vim-obsession' | Plug 'dhruvasagar/vim-prosession'
" Navigation
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'haya14busa/vim-edgemotion'
Plug 'terryma/vim-multiple-cursors'
" Buffers
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Asheq/close-buffers.vim'
Plug 'svermeulen/vim-easyclip'
" Git
Plug 'rhysd/committia.vim'
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/conflict-marker.vim'
Plug 'prakashdanish/vim-githubinator'
Plug 'tyru/open-browser.vim'
Plug 'tyru/open-browser-github.vim'
" Extra languages
Plug 'towolf/vim-helm'
Plug 'hashivim/vim-terraform'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'plasticboy/vim-markdown'
Plug 'saltstack/salt-vim'
Plug 'stephpy/vim-yaml'
Plug 'tarekbecker/vim-yaml-formatter'
" Searching
Plug 'mileszs/ack.vim'
Plug 'dkprice/vim-easygrep'
Plug 'junegunn/fzf'
Plug 'dyng/ctrlsf.vim'
" Ultisnips
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'cwood/ultisnips-terraform-snippets'
" Testing
Plug 'gu-fan/simpleterm.vim'
Plug 't9md/vim-choosewin'
Plug 'google/vim-jsonnet'
Plug 'editorconfig/editorconfig-vim'
call plug#end()

" Plug 'tpope/vim-fugitive'
" Plug 'vim-scripts/grep.vim'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'junegunn/vim-peekaboo'
" Plug 'mattesgroeger/vim-bookmarks'
" Plug 'andrewradev/linediff.vim'
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
" Plug 'tpope/vim-unimpaired'
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-session'
" Plug 'yuttie/comfortable-motion.vim'
" Plug 'sjl/gundo.vim'
" Plug 'tpope/vim-abolish'
" Plug 'mhinz/vim-startify'
