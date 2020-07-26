#!/usr/bin/env zsh

# zmodload zsh/zprof

source ~/.zsh/plugins-pre.zsh
source ~/.zsh/plugins.zsh
source ~/.zsh/powerline-go.zsh
source ~/.zsh/histdb.zsh

# zstyle ':completion:*' menu select
# zstyle ':completion:*' matcher-list	'' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
# zstyle ':zplug:tag' depth 1

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=245"
bindkey '^ ' autosuggest-accept

## ESC + v to edit command
autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

## history
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000
HISTDUP=erase
HSTR_CONFIG=hicolor

setopt bang_hist
setopt extended_history
setopt inc_append_history
setopt no_share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_find_no_dups
setopt hist_ignore_space
setopt hist_save_no_dups
setopt hist_reduce_blanks
setopt hist_verify
# setopt share_history
# setopt append_history

# source /usr/local/etc/profile.d/z.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source ~/.zsh/functions-core.sh
source ~/.zsh/env-core.zsh
source ~/.zsh/env.zsh
source ~/.zsh/functions.sh

# compinit

# zprof
eval "$(direnv hook zsh)"
