#   ----OS SPECIFIC------------------------------
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

source ~/.config/zsh/theme.zsh

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
HISTSIZE=10000
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
source $ZSH/oh-my-zsh.sh
export ARCHFLAGS="-arch $(uname -m)"

#   ----ZSH-AUTOSUGGESTIONS----------------------
bindkey '^ ' autosuggest-accept

#------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------

#   NVIM
#   ---------------------------------------------------------------------------------
alias nv="nvim"

#   BAKED
#   -----------------------------
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'
alias less='less -FSRXc'
alias c="clear"
alias numFiles='echo $(ls -1 | wc -l)'
alias tarball="tar -czvf"
alias untarball="tar -xzvf"

#   CLIENT SHORTCUTS
#   ---------------------------------------
alias modelhorseuniversity="cd ~/code/clients/MHU/websites/model-horse-university/"

#   EZA
#   ---------------------------------------
alias ll="eza --color=always --long --git --icons=always --all"
alias ls="eza --color=always --git --icons=always --all"

#   FZF
#   ---------------------------------------
eval "$(fzf --zsh)"

#   LAZYGIT
#   ---------------------------------------
alias lg="lazygit"

#   GITHUB
#   ---------------------------------------
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
