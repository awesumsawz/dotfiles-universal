#   NOTES
#   ---------------------------------------
#   Ghostty SSH Fix
#   https://github.com/ghostty-org/ghostty/discussions/3911
#   ---------------------------------------
#   ASTROVIM INSTALL:
#   
#   OPTIONAL TOOLS FROM ASTROVIM INSTALL:
#   tree-sitter (npm)
#   ripgrep (brew)
#   lazygit (brew)
#   gdu-go (brew)
#   bottom (brew)
#
#   commands used during installation:
#   mv ~/.local/share/nvim ~/.local/share/nvim.bak
#   mv ~/.local/state/nvim ~/.local/state/
#   git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
#   
#   Installed a number of LspInstall language 
#   ---------------------------------------
#   VS CODE VIM ADJUSTMENTS
#
#   defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false              # For VS Code
#   defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false      # For VS Code Insider
#   defaults write com.vscodium ApplePressAndHoldEnabled -bool false                      # For VS Codium
#   defaults write com.microsoft.VSCodeExploration ApplePressAndHoldEnabled -bool false   # For VS Codium Exploration users
#   defaults delete -g ApplePressAndHoldEnabled                                           # If necessary, reset global default
#
#   Commands run to reverse the above:
#
#   defaults delete com.microsoft.VSCode ApplePressAndHoldEnabled
#   defaults delete com.microsoft.VSCode ApplePressAndHoldEnabled
#   defaults delete com.vscodium ApplePressAndHoldEnabled
#   defaults delete com.microsoft.VSCodeExploration ApplePressAndHoldEnabled
#   ---------------------------------------

#   OH MY ZSH
#   -------------------------
export ZSH="$HOME/.oh-my-zsh"
zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 13
#ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh
export ARCHFLAGS="-arch $(uname -m)"

#   ZSH SETTINGS (BUILD TO REPLACE OMZ)
#   ---------------------------------------
SAVEHIST=5000
HISTSIZE=5000
HISTFILE=~/.zsh_history
# Bind up and down arrow keys to search through command history
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search   # Up arrow key
bindkey '^[[B' down-line-or-beginning-search # Down arrow key


#   BAKED
#   -----------------------------
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display
alias which='type -all'                     # which:        Find executables
alias DT='tee ~/Desktop/terminalOut.txt'    # DT:           Pipe content to file on MacOS Desktop
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'
alias numFiles='echo $(ls -1 | wc -l)'      # numFiles:     Count of non-hidden files in current dir
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash
zipf () { zip -r "$1".zip "$1" ; }          # zipf:         To create a ZIP archive of a folder


#   LOCAL SETTINGS
#  --------------------------------------- 
if [ -f ~/.zshrc_local ]; then
  source ~/.zshrc_local
fi
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

#    WEB DEVELOPMENT
#    ---------------------------------------
alias stree='/Applications/SourceTree.app/Contents/Resources/stree'

#    DOCKER examples
#    ---------------------------------------
# alias dplaybook1f="cd ~/code/docker/caas-platform/"
# alias dplaybook1up="docker-compose -f ~/code/docker/caas-platform/docker-compose.yml up -d"
# alias dplaybook1ssh='docker exec -it caas_wp /bin/bash'
# alias dplaybook1halt="docker-compose -f ~/code/docker/caas-platform/docker-compose.yml down"
# alias dplaybook1db='docker exec -it caas_db /bin/bash'
# alias dplaybook1reboot="docker-compose -f ~/code/docker/caas-platform/docker-compose.yml down && docker-compose -f ~/code/docker/caas-platform/docker-compose.yml up -d"

#    Client Web Shortcuts
#    ---------------------------------------
alias modelhorseuniversity="cd ~/code/clients/MHU/websites/model-horse-university/"
alias playdoughtoplato="cd ~/code/clients/Playdough\ to\ Plato/websites/playdough-to-plato"
alias platopack="cd ~/code/clients/Playdough\ to\ Plato/websites/Plato\ Pack"

#   DOCKER
#   ---------------------------------------
plugins=(... docker docker-compose)

#   EZA
#   ---------------------------------------
alias ls="eza --color=always --git --icons=always --long --no-permissions --no-time --no-filesize"
alias ll="eza --color=always --long --git --icons=always --all"
alias l="ls -la"

#   ZOXIDE
#   ---------------------------------------
unalias cd 2>/dev/null
alias cd="z"

#   STARSHIP
#   ---------------------------------------
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

#   GHOSTTY
#   ---------------------------------------
export GHOSTTY_CONFIG="$HOME/.config/ghostty/config"

#   EVALs
#   ---------------------------------------
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

#   DOCKER
#   ---------------------------------------
#export DOCKER_HOST=unix:///run/user/1000/docker.sock
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock
export PATH=/usr/bin:$PATH

#   HERD
#   ---------------------------------------
export PATH="/Users/jasonbiggs/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/Users/jasonbiggs/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"
export HERD_PHP_84_INI_SCAN_DIR="/Users/jasonbiggs/Library/Application Support/Herd/config/php/84/"
export NVM_DIR="/Users/jasonbiggs/Library/Application Support/Herd/config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[[ -f "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh" ]] && builtin source "/Applications/Herd.app/Contents/Resources/config/shell/zshrc.zsh"
export PATH="/Users/jasonbiggs/Library/Application Support/Herd/bin/":$PATH
