echo "Loading bindkeys zsh..."
# ==================================================
# BINDKEYS
# ----START-----------------------------------------
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region
bindkey '^f' autosuggest-accept
# ----END-------------------------------------------
