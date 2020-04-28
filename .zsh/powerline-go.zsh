#!/usr/bin/env zsh
VERSION="1.17.0"
BIN_PATH="$HOME/.local/bin/powerline-go"

if [[ ! -f "$BIN_PATH" ]]; then
  echo "Installing powerline-go"
  if [[ $(uname -s) =~ "Darwin" ]]; then
    system_type="darwin"
  else
    system_type="linux"
  fi
  curl -sfLo "$BIN_PATH" \
    "https://github.com/justjanne/powerline-go/releases/download/v${VERSION}/powerline-go-${system_type}-amd64"
  chmod a+x "$BIN_PATH"
  echo "powerline-go installed"
fi

FONT_MODE="compatible"
if [ "$TERM" != "linux" ]; then
  FONT_MODE="patched"
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

    PS1="$($BIN_PATH \
        -modules host,ssh,venv,node,cwd,perms,git,aws,kube,duration,exit \
        -duration $__DURATION \
        -shorten-gke-names \
        -mode $FONT_MODE \
        -newline \
        -shell zsh \
        -error $__ERRCODE)"
  unset __TIMER
}

add-zsh-hook preexec powerline_preexec
add-zsh-hook precmd powerline_precmd
