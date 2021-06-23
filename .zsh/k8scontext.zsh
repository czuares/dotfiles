#!/usr/bin/env zsh

PROD_PROFILE_NAME="prod"
PROD_TMUX_BACKGROUND_COLOR="#990808"

function k8s_color() {
  local K8S_CONTEXT=""

  if [[ -n $KUBECONFIG ]] && ! K8S_CONTEXT="$(kubectl config current-context 2>/dev/null)"; then
    return 0;
  fi

  if [[ -n "$TMUX" ]]; then
    local color;
    case "$K8S_CONTEXT" in
      "$PROD_PROFILE_NAME")
        color="$PROD_TMUX_BACKGROUND_COLOR"
        ;;
      *)
        color="default"
        ;;
    esac

    current_pane=$(tmux display -pt "${TMUX_PANE:?}" '#{session_name}:#{window_index}.#{pane_index}')
    tmux set -pt "$current_pane" window-style bg="$color"
  fi
}

function complete_callback() {
  async_stop_worker k8s_worker
}

function k8s_color_async() {
  async_init
  async_start_worker k8s_worker -n
  async_register_callback k8s_worker complete_callback
  async_job k8s_worker k8s_color
}

add-zsh-hook precmd k8s_color_async
