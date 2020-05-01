#!/usr/bin/env zsh

if command -v pyenv &>/dev/null; then
  eval "$(pyenv init - zsh --no-rehash)"
  pyenv virtualenvwrapper
fi
