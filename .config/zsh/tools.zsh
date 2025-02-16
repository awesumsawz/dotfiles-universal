# ==================================================
# TOOL CONFIGURATIONS
# ----START-----------------------------------------
# fzf
eval "$(fzf --zsh)"
# github 
eval "$(gh copilot alias -- zsh)"
# ghostty
export GHOSTTY_CONFIG="$HOME/.config/ghostty/config"
# starship
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init zsh)" 
# zoxide
eval "$(zoxide init zsh)"
# thefuck
eval "$(thefuck --alias fix)"
# eza
export EZA_CONFIG_DIR="$HOME/.config/eza"
export LS_COLORS="$(vivid generate dracula)"
# 1password
if [[ -f ~/.op_session ]]; then
    source ~/.op_session
fi
eval "$(op signin)" > ~/.op_session
eval "$(op signin --session-timeout=2h)"
eval "$(op ssh-agent start)"

# ----END-------------------------------------------
