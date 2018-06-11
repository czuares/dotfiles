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

    local k8scontext="$(kubectl config current-context 2>/dev/null)"
    if [[ $? == 0 ]] && [[ -n "$TMUX" ]]; then
        if [[ "$k8scontext" == "prod" ]]; then
            tmux select-pane -P 'bg=#990808'
        else
            tmux select-pane -P 'bg=default'
        fi
    else
        if [[ "$k8scontext" == "prod" ]]; then
            echo -ne "\033]50;SetProfile=ProdK8s\a"
        else
            echo -ne "\033]50;SetProfile=Default\a"
        fi
    fi
}

function install_powerline_precmd() {
    for s in "${precmd_functions[@]}"; do
        if [ "$s" = "powerline_precmd" ]; then
            return
        fi
    done
    precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi

