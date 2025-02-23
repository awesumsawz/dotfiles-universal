# ==================================================
# ZSH HISTORY SETTINGS
# --------------------------------------------------
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
HISTDUP=erase

# History Options
setopt appendhistory     # Append to history file
setopt sharehistory      # Share history across sessions
setopt hist_ignore_space # Don't record commands starting with space
setopt hist_ignore_all_dups # Remove older duplicate entries
setopt hist_save_no_dups # Don't save duplicate entries
setopt hist_ignore_dups  # Don't record duplicates
setopt hist_find_no_dups # Don't display duplicates when searching

# ==================================================
# EDITOR SETTINGS
# --------------------------------------------------
# Use neovim by default, fallback to vim when in SSH
export EDITOR="${SSH_CONNECTION:+vim}${SSH_CONNECTION:-nvim}"
