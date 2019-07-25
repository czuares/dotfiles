#!/usr/bin/env zsh
# https://github.com/larkery/zsh-histdb
# https://github.com/drewis/go-histdbimport

# autoload -Uz add-zsh-hook
# add-zsh-hook precmd histdb-update-outcome

_zsh_autosuggest_strategy_histdb_top_here() {
    local query="select commands.argv from
history left join commands on history.command_id = commands.rowid
left join places on history.place_id = places.rowid
where places.dir LIKE '$(sql_escape $PWD)%'
and commands.argv LIKE '$(sql_escape $1)%'
group by commands.argv order by count(*) desc limit 1"
    suggestion=$(_histdb_query "$query")
}

_zsh_autosuggest_strategy_histdb_top() {
    local query="select commands.argv from
history left join commands on history.command_id = commands.rowid
left join places on history.place_id = places.rowid
where commands.argv LIKE '$(sql_escape $1)%'
group by commands.argv
order by places.dir != '$(sql_escape $PWD)', count(*) desc limit 1"
    suggestion=$(_histdb_query "$query")
}

# ZSH_AUTOSUGGEST_STRATEGY=histdb_top
# ZSH_AUTOSUGGEST_STRATEGY=histdb_top_here
# bindkey '^r' _histdb-isearch
