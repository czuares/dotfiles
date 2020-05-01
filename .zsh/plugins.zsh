#!/usr/bin/env zsh

# Source zplug
export ZPLUG_HOME=$HOME/.zplug
if [[ ! -f $ZPLUG_HOME/init.zsh ]]; then
  rm -rf "$ZPLUG_HOME"
  echo "Updating zplug"
  git clone https://github.com/zplug/zplug $ZPLUG_HOME
fi

source $ZPLUG_HOME/init.zsh

zplug "zplug/zplug"
zplug "plugins/z",  from:oh-my-zsh
zplug "mafredri/zsh-async", from:github
zplug "larkery/zsh-histdb", from:github, at:d831a3a222e138ecdd65c225779f49bca52813f8
zplug "zsh-users/zsh-autosuggestions", at:develop
# zplug "zsh-users/zsh-completions"
zplug "zdharma/history-search-multi-word"
# zplug "plugins/git",  from:oh-my-zsh
# zplug "wfxr/forgit"
zplug "zsh-users/zsh-syntax-highlighting", defer:3
# zplug "plugins/virtualenvwrapper",  from:oh-my-zsh

# zplug "plugins/aws",  from:oh-my-zsh
# zplug "unixorn/git-extra-commands"
# zplug "unixorn/warhol.plugin.zsh"
# zplug "plugins/common-aliases",  from:oh-my-zsh
# zplug "plugins/gpg-agent",  from:oh-my-zsh
# zplug "plugins/ssh-agent",  from:oh-my-zsh
# zplug "zsh-users/zsh-history-substring-search"
# zplug "plugins/docker",  from:oh-my-zsh
# zplug "plugins/helm",  from:oh-my-zsh
# zplug "plugins/kubectl",  from:oh-my-zsh
# zplug "plugins/python",  from:oh-my-zsh

# export USE_NERD_FONT=1
# zplug "eendroroy/alien", from:github, as:theme

# zplug "mafredri/zsh-async", from:github
# zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

# zplug "geometry-zsh/geometry", from:github, as:theme

# zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme

# setopt prompt_subst # Make sure prompt is able to be generated properly.
# zplug "caiogondim/bullet-train.zsh", use:bullet-train.zsh-theme, defer:3

# Install packages that have not been installed yet
if ! zplug check --verbose; then
  echo; zplug install
fi

zplug load

# GEOMETRY_PROMPT_PLUGINS=(virtualenv kube exec_time git)

# Alien
# MODULES=(git ssh python time)

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
