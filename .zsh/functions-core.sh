#!/usr/bin/env bash

function brew() {
    local dump=false;
    if [[ $# -gt 0 ]]; then
        case "$1" in
            *install)
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
