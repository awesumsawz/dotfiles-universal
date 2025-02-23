# ==================================================
# ZINIT PLUGIN MANAGER SETUP
# --------------------------------------------------
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.config}/zinit/zinit.git"

# Auto-install zinit if not present
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# ==================================================
# CORE ZSH ENHANCEMENTS
# --------------------------------------------------
zinit light zsh-users/zsh-autosuggestions     # Fish-like autosuggestions
zinit light zsh-users/zsh-syntax-highlighting # Syntax highlighting
zinit light zsh-users/zsh-completions        # Additional completions
zinit light aloxaf/fzf-tab                   # Fuzzy completion

# ==================================================
# OH-MY-ZSH PLUGINS AND SNIPPETS
# --------------------------------------------------
# Ensure completions directory exists
if [ ! -d "$HOME/.cache/zinit/completions" ]; then
    mkdir -p "$HOME/.cache/zinit/completions"
fi

# Development Tools
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::docker
zinit snippet OMZP::docker-compose
zinit snippet OMZP::laravel
zinit snippet OMZP::npm
zinit snippet OMZP::terraform
zinit snippet OMZP::wp-cli
zinit snippet OMZP::vscode

# System Utilities
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found
zinit snippet OMZP::systemd
zinit snippet OMZP::ssh-agent

# Productivity Enhancements
zinit snippet OMZP::1password
zinit snippet OMZP::alias-finder
zinit snippet OMZP::bgnotify
zinit snippet OMZP::vi-mode

# Optional/Commented Plugins
# zinit snippet OMZP::tmux
# zinit snippet OMZP::helm

# ==================================================
# COMPLETION SYSTEM INITIALIZATION
# --------------------------------------------------
autoload -Uz compinit && compinit
zinit cdreplay -q
