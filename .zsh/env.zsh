#!/usr/bin/env zsh

export EDITOR=vim
export CLICOLOR=1
export GIT_EDITOR="$EDITOR"
export USE_EDITOR="$EDITOR"
export VISUAL=$EDITOR
export PAGER=less

export PROJECT_HOME="$HOME/proj"

# /usr/local/opt/go/libexec/bin:
# export PATH="/usr/local/sbin:$PATH" # make homebrew happy
# export PATH="/usr/X11/bin:$PATH"    # x11
export PATH="$PATH:$HOME/bin:$HOME/go/bin:$HOME/.local/bin" # custom
# fpath=(/usr/local/share/zsh-completions $fpath)

alias vi=vim
alias d=docker
alias dc=docker-compose
alias tf=terraform
alias k=kubectl
alias kc=kubectx
alias kn=kubens
alias tfplan="terraform plan -out plan.tfplan"
alias tfapply="terraform apply plan.tfplan"
alias proj="cd $PROJECT_HOME"

alias ls='LC_COLLATE=C ls'
alias ll='ls -lAh'


