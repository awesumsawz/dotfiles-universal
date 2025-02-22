# ==================================================
# PLUGIN MANAGER
# ----START-----------------------------------------
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.config}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"
# ----END-------------------------------------------

# ==================================================
# PLUGINS
# ----START-----------------------------------------
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light aloxaf/fzf-tab
# ----END-------------------------------------------

# ==================================================
# SNIPPETS
# ----START-----------------------------------------
# ensure the completions directory exists
if [ ! -d "$HOME/.cache/zinit/completions" ]; then
  mkdir -p "$HOME/.cache/zinit/completions"
fi
# load snippets
zinit snippet OMZP::1password
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::aws
zinit snippet OMZP::command-not-found
zinit snippet OMZP::alias-finder
zinit snippet OMZP::bgnotify
zinit snippet OMZP::docker
zinit snippet OMZP::docker-compose
zinit snippet OMZP::laravel
zinit snippet OMZP::npm
zinit snippet OMZP::ssh-agent
zinit snippet OMZP::systemd
# zinit snippet OMZP::tmux
zinit snippet OMZP::vi-mode
zinit snippet OMZP::vscode
zinit snippet OMZP::wp-cli
zinit snippet OMZP::terraform
# zinit snippet OMZP::helm
# compile completions
autoload -Uz compinit && compinit
zinit cdreplay -q
# ----END-------------------------------------------
