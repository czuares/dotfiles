#!/usr/bin/env bash

function brew() {
    local dump=false;
    if [[ $# -gt 0 ]]; then
        case "$1" in
            *install|*tap)
                dump=true;
                ;;
            cask)
                if [[ $# -gt 2 ]]; then
                    case "$2" in
                        *install)
                            dump=true;
                            ;;
                    esac
                fi
                ;;
        esac
    fi
    command brew "$@"

    if $dump; then
        echo "Updating Brewfile"
        command brew bundle dump --force --file="$HOME/Brewfile"
    fi
}

function hist() {
    vim ~/.zsh_history
    # if [[ $# -gt 0 ]]; then
    #     local hist_file=$HOME/.zsh_history
    #     cp "$hist_file"{,bak}
    #     sed -i '' -e '$ d' "$hist_file"
    #     return 0
    # fi
}
