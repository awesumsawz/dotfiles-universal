#   ----OS SPECIFIC------------------------------
if [[ "$OSTYPE" == "linux"* ]]; then
  [[ -f ~/.zsh_linux ]] && source ~/.zsh_linux
elif [[ "$OSTYPE" == "darwin"* ]]; then
  export PATH="$HOME/.local/bin:$PATH"
  [[ -f ~/.zsh_mac ]] && source ~/.zsh_mac
  [[ -f ~/.zsh_knight && $HOSTNAME == Knight* ]] && source ~/.zsh_knight
fi

source ~/.zsh_theming

#  ----LOCAL------------------------------------- 
if [ -f ~/.zshrc_local ]; then
  source ~/.zshrc_local
fi
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

#   ----ZSH--------------------------------------
SAVEHIST=5000
HISTSIZE=5000
HISTFILE=~/.zsh_history

#   ----OH-MY-ZSH--------------------------------
export ZSH="$HOME/.oh-my-zsh"
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  docker 
  docker-compose
)
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 13
COMPLETION_WAITING_DOTS="true"
source $ZSH/oh-my-zsh.sh
export ARCHFLAGS="-arch $(uname -m)"

#   ----ZSH-AUTOSUGGESTIONS----------------------
bindkey '^ ' autosuggest-accept

#------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------

#   BAKED
#   -----------------------------
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'
alias less='less -FSRXc'
alias ~="cd ~"
alias c="clear"
alias which='type -all'
alias numFiles='echo $(ls -1 | wc -l)'
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash
zipf () { zip -r "$1".zip "$1" ; }          # zipf:         To create a ZIP archive of a folder

#   CLIENT SHORTCUTS
#   ---------------------------------------
alias modelhorseuniversity="cd ~/code/clients/MHU/websites/model-horse-university/"

#   EZA
#   ---------------------------------------
alias ls="eza --color=always --git --icons=always --long --no-permissions --no-time --no-filesize"
alias ll="eza --color=always --long --git --icons=always --all"
alias l="ls -la"

#   FZF
#   ---------------------------------------
alias fz="fzf"
eval "$(fzf --zsh)"

#   GITHUB
#   ---------------------------------------
alias ghc="gh copilot"
eval "$(gh copilot alias -- zsh)"

#   GHOSTTY
#   ---------------------------------------
export GHOSTTY_CONFIG="$HOME/.config/ghostty/config"

#   STARSHIP
#   ---------------------------------------
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init zsh)" 

#   ZOXIDE
#   ---------------------------------------
unalias cd 2>/dev/null
alias cd="z"
eval "$(zoxide init zsh)"


# Herd injected PHP 8.4 configuration.
export HERD_PHP_84_INI_SCAN_DIR="/Users/jasonbiggs/Library/Application Support/Herd/config/php/84/"
