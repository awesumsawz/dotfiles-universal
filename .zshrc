export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

source "$XDG_CONFIG_HOME/zsh/_index.zsh"

# bun completions
[ -s "/Users/jasonbiggs/.bun/_bun" ] && source "/Users/jasonbiggs/.bun/_bun"
