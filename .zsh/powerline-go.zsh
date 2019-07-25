#!/usr/bin/env zsh
#
if [[ ! -f $HOME/go/bin/powerline-go ]]; then
    echo "Updating powerline-go"
    go get -u github.com/justjanne/powerline-go
fi

#### Powerline-go configuration
function powerline_preexec() {
  __TIMER=$SECONDS
}

function powerline_precmd() {
    local __ERRCODE=$?
    local __DURATION=0

    if [ -n $__TIMER ]; then
        local __ERT=$SECONDS
        __DURATION="$(($__ERT - ${__TIMER:-__ERT}))"
    fi
    
    PS1="$(~/go/bin/powerline-go \
        -modules host,ssh,venv,node,cwd,perms,git,aws,kube,duration,exit \
        -duration $__DURATION \
        -shorten-gke-names \
        -mode patched \
        -newline \
        -shell zsh \
        -error $__ERRCODE)"
  unset __TIMER

}

if [ "$TERM" != "linux" ]; then
  add-zsh-hook preexec powerline_preexec
  add-zsh-hook precmd powerline_precmd
fi
