if has('clipboard')
  set clipboard& clipboard+=unnamedplus
endif

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
