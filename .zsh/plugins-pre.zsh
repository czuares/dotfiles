#!/usr/bin/env zsh

# Fix issue with histdb
export HISTDB_TABULATE_CMD=(sed -e $'s/\x1f/\t/g')
