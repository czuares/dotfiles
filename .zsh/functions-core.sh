#!/usr/bin/env bash

#function terraform() {
#    local confirm=false, plan=false

#    while test $# -gt 0
#    do
#        case "$1" in
#            plan)
#                plan=true; confirm=false
#                ;;
#            -auto-approve|*destroy|-force)
#                if ! $plan; then
#                   confirm=true
#                fi
#                ;;
#        esac
#        shift
#    done
#    if $confirm; then
#        #shellcheck disable=SC1117
#        echo -e "***WARNING!***\nDangerous command detected!\n\nAre you sure you'd like to continue? [y/n]"
#        read -r
#        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
#            echo "Action Cancelled"
#            return 1
#        fi
#    fi
#    command terraform "$@"
#}

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
