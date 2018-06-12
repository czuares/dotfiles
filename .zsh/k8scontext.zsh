#!/usr/bin/env zsh

PROD_PROFILE_NAME="prod"
PROD_TMUX_BACKGROUND_COLOR="#990808"
PROD_ITERM_PROFILE="ProdK8s"

function k8s_color() {
    local k8scontext="$(kubectl config current-context 2>/dev/null)"
    if [[ $? -ne 0 ]]; then
        return 0;
    fi

    if [[ -n "$TMUX" ]]; then
        local color;
        case "$k8scontext" in
            "$PROD_PROFILE_NAME")
                color="$PROD_TMUX_BACKGROUND_COLOR"
                ;;
            *)
                color="default"
                ;;
        esac
        tmux select-pane -P "bg=$color"
    fi

    if [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
        local profile;
        case "k8scontext" in
            "$PROD_PROFILE_NAME")
                profile="$PROD_ITERM_PROFILE"
                ;;
            *)
                profile="Default"
                ;;
        esac

        echo -ne "\033]50;SetProfile=$profile\a"
    fi
}

function complete_callback() {
    async_stop_worker worker
}

function k8s_color_async() {
    async_init
    async_start_worker worker -n
    async_register_callback worker complete_callback
    async_job worker k8s_color 
}

add-zsh-hook precmd k8s_color_async