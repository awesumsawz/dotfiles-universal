# Main ZSH configuration index
# Sources all configuration files in a specific order

# Core configurations
source "$XDG_CONFIG_HOME/zsh/settings.zsh"  # Basic ZSH settings
source "$XDG_CONFIG_HOME/zsh/plugins.zsh"   # Plugin management
source "$XDG_CONFIG_HOME/zsh/bindkeys.zsh"  # Key bindings
source "$XDG_CONFIG_HOME/zsh/style.zsh"     # Prompt and appearance
source "$XDG_CONFIG_HOME/zsh/aliases.zsh"   # Common aliases
source "$XDG_CONFIG_HOME/zsh/tools.zsh"     # Tool-specific configurations

# OS-specific configuration
if [[ "$OSTYPE" == "linux"* ]]; then
  local os_config="$XDG_CONFIG_HOME/zsh/linux.zsh"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  local os_config="$XDG_CONFIG_HOME/zsh/mac.zsh"
fi

# Local machine-specific configuration
local local_config="$XDG_CONFIG_HOME/zsh/local.zsh"

# Source OS and local configs if they exist
[[ -f "$os_config" ]] && source "$os_config"
[[ -f "$local_config" ]] && source "$local_config"
