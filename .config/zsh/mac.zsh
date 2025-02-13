#   HERD INJECTED CONFIG
#   ---------------------------------------
export PATH="/Users/jasonbiggs/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/Users/jasonbiggs/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"
export HERD_PHP_84_INI_SCAN_DIR="/Users/jasonbiggs/Library/Application Support/Herd/config/php/84/"
export NVM_DIR="/Users/jasonbiggs/Library/Application Support/Herd/config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[[ -f "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh" ]] && builtin source "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh"
export PATH="/Users/jasonbiggs/Library/Application Support/Herd/bin/":$PATH
