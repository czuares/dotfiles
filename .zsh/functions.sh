#!/usr/bin/env bash

function make-venv() {
    : ${1?Project name is required}
    mkvirtualenv -p python3.6 -a ~/proj/$1 $1
}

function update-salt-users-state() {
    if [[ ${VIRTUAL_ENV##*/} != "sysalt" ]]; then
        echo "Not in sysalt venv"
        return 1
    fi
    : ${1?Target is required}
    salt-ssh -i $1 state.sls syapse-users "${@:2}"
}

function ssh-circleci() {
    : ${1?Expected parameters <port> <host>}
    ssh -o "UserKnownHostsFile /dev/null" \
        -o "StrictHostKeyChecking no" \
        -o "LogLevel ERROR" -p "$@"
}

function dedupe-history() {
    cp ~/.zsh_history{,-old}
    tmpFile=`mktemp`
    awk -F ";" '!seen[$2]++' ~/.zsh_history > $tmpFile
    # echo $tmpFile
    mv $tmpFile ~/.zsh_history
}

function git-set-upstream() {
    local branch="$(git rev-parse --abbrev-ref HEAD)"
    echo "Current branch $branch"
    git branch --set-upstream-to=origin/$branch $branch
}

function okta-pass() {
    lpass show -cp okta.com
}

function gh() {
    : ${1?Expected repo name}
    open "https://github.com/syapse/$1"
}

function create-ssh-user() {
    : "${1?Path to key expected}"
    : "${2?Username expected}"

    local key
    local user
    local keypath
    key="$1"
    user="$2"
    keypath="$HOME/proj/sysalt/salt/states/syapse-users/keys/$user.id_rsa.pub"

    if [[ ! -e "$key" ]]; then
        echo "Path to $key is invalid!"
        return 1
    elif [[ -e "$keypath" ]]; then
        echo "Key already exists at $keypath"
        return 1
    fi

    mv "$key" "$keypath"
    workon sysalt
    ./scripts/add-user-to-bastion.sh "$user"

}
