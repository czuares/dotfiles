#!/usr/bin/env zsh

hash powerline-go 2>/dev/null 
if [[ $? != 0 ]]; then
    go get -u github.com/justjanne/powerline-go
fi

#### Powerline-go configuration
function powerline_precmd() {
    PS1="$(~/go/bin/powerline-go \
        -modules venv,cwd,git,aws,kube,exit \
        -shorten-gke-names \
        -newline \
        -shell zsh \
        -error $? -shell zsh)"
}
add-zsh-hook precmd powerline_precmd
