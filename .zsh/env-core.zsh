#!/usr/bin/env zsh

export EDITOR=vim
export CLICOLOR=1
export GIT_EDITOR="$EDITOR"
export USE_EDITOR="$EDITOR"
export VISUAL=$EDITOR
export PAGER=less

export PROJECT_HOME="$HOME/proj"

alias vi=vim
alias d=docker
alias dc=docker-compose
alias proj="cd $PROJECT_HOME"

alias ..="cd .."
alias ...="cd ../.."

alias ll='ls -lAh'
alias help='tldr'
alias diskusage="ncdu --color dark -rr -x --exclude .git"

alias tf=terraform
alias k=kubectl
alias kc=kubectx
alias kn=kubens
