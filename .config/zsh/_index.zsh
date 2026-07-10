# Main ZSH configuration index
# Sources all configuration files in a specific order

# ZSH config directory path
local zsh_dir="$XDG_CONFIG_HOME/zsh"

# Core configurations
source "$zsh_dir/settings.zsh"  # Basic ZSH settings
source "$zsh_dir/plugins.zsh"   # Plugin management
source "$zsh_dir/bindkeys.zsh"  # Key bindings
source "$zsh_dir/style.zsh"     # Prompt and appearance
source "$zsh_dir/aliases.zsh"   # Common aliases
source "$zsh_dir/functions.zsh" # Common functions
source "$zsh_dir/tools.zsh"     # Tool-specific configurations

# OS-specific configuration
if [[ "$OSTYPE" == "linux"* ]]; then
  local os_config="$zsh_dir/linux.zsh"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  local os_config="$zsh_dir/mac.zsh"
fi

# Local machine-specific configuration
local local_config="$zsh_dir/local.zsh"

# Source OS and local configs if they exist
[[ -f "$os_config" ]] && source "$os_config"
[[ -f "$local_config" ]] && source "$local_config"
