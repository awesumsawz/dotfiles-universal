# OS
# ==================================================
if [[ "$OSTYPE" == "linux"* ]]; then
  [[ -f ~/.zsh_linux ]] \
    && source ~/.zsh_linux
elif [[ "$OSTYPE" == "darwin"* ]]; then
  export PATH="$HOME/.local/bin:$PATH"
  [[ -f ~/.config/zsh/mac.zsh ]] \
    && source ~/.config/zsh/mac.zsh
  [[ -f ~/.config/zsh/knight.zsh && $HOSTNAME == Knight* ]] \
    && source ~/.config/zsh/knight.zsh
fi

# LOCAL
# ==================================================
if [ -f ~/.zshrc_local ]; then
  source ~/.zshrc_local
fi

# SETTINGS
# ==================================================
source ~/.config/zsh/settings.zsh

# PLUGINS
# ==================================================
source ~/.config/zsh/plugins.zsh

# BINDKEYS
# ==================================================
source ~/.config/zsh/bindkeys.zsh

# STYLING
# ==================================================
source ~/.config/zsh/style.zsh

# ALIASES
# ==================================================
source ~/.config/zsh/aliases.zsh

# TOOLS
# ==================================================
source ~/.config/zsh/tools.zsh

# ==================================================
# ==================================================
# ==================================================
# ==================================================
# ==================================================