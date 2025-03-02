# Mac ZSH configuration

# Homebrew setup
if [[ -f "/opt/homebrew/bin/brew" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
export HOMEBREW_BREWFILE="$HOME/.config/brewfile/brewfile"
export DYLD_FALLBACK_LIBRARY_PATH="$(brew --prefix)/lib:$DYLD_FALLBACK_LIBRARY_PATH"

# Path configurations
export PATH="${HOME}/.config/herd-lite/bin:${PATH}"
export PATH="${HOME}/.local/bin:${PATH}"

# PHP configuration
export PHP_INI_SCAN_DIR="${HOME}/.config/herd-lite/bin:${PHP_INI_SCAN_DIR}"

# Nix-Darwin aliases
unalias drs 2>/dev/null  # Suppress error if alias doesn't exist
alias drs="darwin-rebuild switch --flake ~/nix#knight"

# github 
eval "$(gh copilot alias -- zsh)"
