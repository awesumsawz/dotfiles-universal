if [[ -f "/opt/homebrew/bin/brew" ]] then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
export PATH="/Users/jasonbiggs/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/Users/jasonbiggs/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

