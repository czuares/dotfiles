# Source zplug - should be installed from brew
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# export TERM="xterm-256color"
export EDITOR="vim"
export CLICOLOR=1
export PROJECT_HOME="$HOME/proj"

# zplug "zplug/zplug"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zdharma/history-search-multi-word"
zplug "plugins/git",  from:oh-my-zsh
zplug "plugins/virtualenvwrapper",  from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting", defer:3

# zplug "unixorn/git-extra-commands"
# zplug "unixorn/warhol.plugin.zsh"
# zplug "plugins/common-aliases",  from:oh-my-zsh
# zplug "plugins/gpg-agent",  from:oh-my-zsh
# zplug "plugins/ssh-agent",  from:oh-my-zsh
# zplug "plugins/z",  from:oh-my-zsh
# zplug "plugins/aws",  from:oh-my-zsh
# zplug "zsh-users/zsh-history-substring-search"
# zplug "plugins/docker",  from:oh-my-zsh
# zplug "plugins/helm",  from:oh-my-zsh
# zplug "plugins/kubectl",  from:oh-my-zsh
# zplug "plugins/python",  from:oh-my-zsh

# zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme

# setopt prompt_subst # Make sure prompt is able to be generated properly.
# zplug "caiogondim/bullet-train.zsh", use:bullet-train.zsh-theme, defer:3

# Install packages that have not been installed yet
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi

zplug load

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=245"
bindkey '^ ' autosuggest-accept

# zstyle ':completion:*' menu select
# zstyle ':completion:*' matcher-list	'' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
# zstyle ':zplug:tag' depth 1

# POWERLEVEL9K_MODE='nerdfont-complete'
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status virtualenv aws kubecontext)
# POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
# POWERLEVEL9K_SHORTEN_DELIMITER=''
# POWERLEVEL9K_DIR_OMIT_FIRST_CHARACTER=true
# POWERLEVEL9K_PROMPT_ON_NEWLINE=true
# POWERLEVEL9K_BATTERY_VERBOSE=false
# POWERLEVEL9K_RPROMPT_ON_NEWLINE=false
# POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{014}╭%F{cyan}"
# POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{014}\u2570%F{cyan}\uF460%F{073}\uF460%F{109}\uF460%f "

# # Bulletrain settings
# BULLETTRAIN_PROMPT_CHAR="%F{014}\u2570%F{cyan}\uF460%F{073}\uF460%F{109}\uF460%f"
# BULLETTRAIN_KCTX_KCONFIG=$HOME/.kube/config
# BULLETTRAIN_AWS_FG=white
# BULLETTRAIN_STATUS_EXIT_SHOW=true
# BULLETTRAIN_PROMPT_ORDER=(
# dir
# git
# virtualenv
# kctx
# aws
# )

# Setup GPG
export GPG_AGENT_INFO="~/.gnupg/S.gpg-agent:$(pgrep gpg-agent):1"
eval $(keychain --eval --quiet --agents gpg,ssh id_rsa 0x97756AE7B8A4FDA9)

## ESC + v to edit command
autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

## history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
HISTDUP=erase

setopt no_share_history
setopt append_history
setopt hist_save_no_dups
setopt inc_append_history
setopt hist_expire_dups_first
setopt extended_history
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_verify
# setopt hist_ignore_dups 
# setopt hist_no_store

alias d=docker
alias dc=docker-compose
alias tf=terraform
alias k=kubectl
alias kc=kubectx
alias kn=kubens
alias tfplan="terraform plan -out plan.tfplan"
alias tfapply="terraform apply plan.tfplan"
alias proj="cd $PROJECT_HOME"

alias ls='LC_COLLATE=C ls'
alias ll='ls -lAh'

source <(kubectl completion zsh)
source <(stern --completion=zsh)
source ~/.local/bin/aws_zsh_completer.sh

# /usr/local/opt/go/libexec/bin:
# export PATH="/usr/local/sbin:$PATH" # make homebrew happy
# export PATH="/usr/X11/bin:$PATH"    # x11
export PATH="$PATH:$HOME/bin:$HOME/go/bin:$HOME/.local/bin" # custom
# fpath=(/usr/local/share/zsh-completions $fpath)

# . virtualenvwrapper.sh
. /usr/local/etc/profile.d/z.sh
. ~/.aws_aliases
. ~/.zsh/functions.sh

# Source chtf
if [[ -f /usr/local/share/chtf/chtf.sh ]]; then
    source "/usr/local/share/chtf/chtf.sh"
    chtf 0.10.8
fi


#### Powerline-go configuration
function powerline_precmd() {
    PS1="$(~/go/bin/powerline-go \
        -modules venv,cwd,git,aws,kube,exit \
        -shorten-gke-names \
        -newline \
        -shell zsh \
        -error $? -shell zsh)"
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
