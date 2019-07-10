#!/usr/bin/env zsh

export EDITOR=vim
export CLICOLOR=1
export GIT_EDITOR="$EDITOR"
export USE_EDITOR="$EDITOR"
export VISUAL=$EDITOR
export PAGER=less

export PROJECT_HOME="$HOME/proj"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/sbin:$PATH" # make homebrew happy
export PATH="$PATH:$HOME/bin:$HOME/go/bin:$HOME/private/scripts" # custom
export PATH="$PATH:$(python3 -m site --user-base)/bin" # add python3 user installed packages
# fpath=(/usr/local/share/zsh-completions $fpath)

alias rm=trash
alias vi=vim
alias d=docker
alias dc=docker-compose
alias tf=terraform
alias k=kubectl
alias kc=kubectx
alias kn=kubens
alias tfplan="command terraform plan -out plan.tfplan"
alias tfapply="command terraform apply plan.tfplan"
alias proj="cd $PROJECT_HOME"

alias ..="cd .."
alias ...="cd ../.."
alias ls='LC_COLLATE=C ls'
alias ll='ls -lAh'
alias cat='bat'
alias du="ncdu --color dark -rr -x --exclude .git"
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias help='tldr'
alias ping='prettyping --nolegend'
