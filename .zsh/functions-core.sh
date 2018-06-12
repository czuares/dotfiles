#!/usr/bin/env bash

function brew() {
    local dump=false;
    if [[ $# -gt 0 ]]; then
        case "$1" in
            *install)
                dump=true;
                ;;
        esac
    fi
    command brew "$@"

    if $dump; then
        echo "Updating Brewfile"
        command brew bundle dump --force
    fi
}
