#!/usr/bin/env zsh

export ZINIT_HOME=$HOME/.zinit
if [[ ! -f $ZINIT_HOME/zinit.zsh ]]; then
  rm -rf "$ZINIT_HOME"
  echo "Installing zinit"
  git clone https://github.com/zdharma/zinit.git $ZINIT_HOME
fi

source $ZINIT_HOME/zinit.zsh

zinit wait lucid light-mode for \
  atinit="zicompinit; zicdreplay" \
      zdharma/history-search-multi-word \
  atload="_zsh_autosuggest_start" \
      zsh-users/zsh-autosuggestions \
      zdharma/fast-syntax-highlighting \
  blockf atpull='zinit creinstall -q .' \
      zsh-users/zsh-completions

zinit light mafredri/zsh-async
zinit light larkery/zsh-histdb

zinit snippet https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/z/z.sh
# zinit ice mv="z.sh -> z" pick="z" as"program"
# zinit snippet https://github.com/rupa/z/blob/master/z.sh

bindkey '^ ' autosuggest-accept
# zinit light-mode trackbinds bindmap='!"^ " -> autosuggest-accept' for zdharma/fast-syntax-highlighting
# zinit bindmap='!"^ " -> autosuggest-accept' for zdharma/fast-syntax-highlighting

# zinit ice blockf atpull'zinit creinstall -q .'
# zinit light zsh-users/zsh-completions

# autoload compinit
# compinit

# zinit light zdharma/history-search-multi-word
# zinit light zdharma/fast-syntax-highlighting
# # zinit light zsh-users/zsh-syntax-highlighting
# zinit light zsh-users/zsh-autosuggestions

# zinit from"gh-r" as"program" mv"direnv* -> direnv" \
#     atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' \
#     pick"direnv" src="zhook.zsh" for \
#         direnv/direnv




####################################################################
# Begin zplug
#
# Source zplug
# export ZPLUG_HOME=$HOME/.zplug
# if [[ ! -f $ZPLUG_HOME/init.zsh ]]; then
#   rm -rf "$ZPLUG_HOME"
#   echo "Updating zplug"
#   git clone https://github.com/zplug/zplug $ZPLUG_HOME
# fi

# source $ZPLUG_HOME/init.zsh

# zplug "zplug/zplug"
# zplug "plugins/z",  from:oh-my-zsh
# zplug "mafredri/zsh-async", from:github
# zplug "larkery/zsh-histdb", from:github, at:d831a3a222e138ecdd65c225779f49bca52813f8
# zplug "zsh-users/zsh-autosuggestions", at:develop
# zplug "zdharma/history-search-multi-word"
# zplug "zsh-users/zsh-syntax-highlighting", defer:3
#
# zplug "softmoth/zsh-vim-mode", from:github
# zplug "zsh-users/zsh-completions"
# zplug "plugins/git",  from:oh-my-zsh
# zplug "wfxr/forgit"
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



# # Install packages that have not been installed yet
# if ! zplug check --verbose; then
#   echo; zplug install
# fi

# zplug load
#
# End zplug
####################################################################
