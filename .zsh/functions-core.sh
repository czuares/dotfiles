#!/usr/bin/env bash

# Source custom files
if [[ -d ~/private/scripts ]]; then
  for f in ~/private/scripts/source/*
  do
    source "$f"
  done
fi

function hist() {
  vim ~/.zsh_history

  # if [[ $# -gt 0 ]]; then
  #     local hist_file=$HOME/.zsh_history
  #     cp "$hist_file"{,bak}
  #     sed -i '' -e '$ d' "$hist_file"
  #     return 0
  # fi
}

dedupe-history() {
  cp ~/.zsh_history{,-old}
  tmpFile=$(mktemp)
  awk -F ";" '!seen[$2]++' ~/.zsh_history > "$tmpFile"
  # echo $tmpFile
  mv "$tmpFile" ~/.zsh_history
}

git-set-upstream() {
  local branch
  branch="$(git rev-parse --abbrev-ref HEAD)"
  echo "Current branch $branch"
  git branch --set-upstream-to="origin/$branch" "$branch"
}

gtop() {
  cd "$(git rev-parse --show-toplevel)" || true
}
