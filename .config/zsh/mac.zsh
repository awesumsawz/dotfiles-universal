echo "Loading mac zsh..."
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

# Laravel aliases
alias art="php artisan"
alias tinker="php artisan tinker"
alias migrate="php artisan migrate"
alias sail="./vendor/bin/sail"
alias pest="./vendor/bin/pest"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
