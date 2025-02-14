# ==================================================
# INITIALIZATION
# ----START-----------------------------------------
source ~/.config/zsh/theme.zsh
# os
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
# local
if [ -f ~/.zshrc_local ]; then
  source ~/.zshrc_local
fi
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi
# zsh
SAVEHIST=10000
HISTSIZE=10000
HISTFILE=~/.zsh_history
# ----END-------------------------------------------

# ==================================================
# PLUGIN MANAGER
# ----START-----------------------------------------
# oh-my-zsh
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
# ----END-------------------------------------------

# ==================================================
# PLUGINS
# ----START-----------------------------------------
# zsh-autosuggestions
bindkey '^ ' autosuggest-accept
# ----END-------------------------------------------

# ==================================================
# ALIASES
# ----START-----------------------------------------
# nvim
alias nv="nvim"
# baked
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'
alias less='less -FSRXc'
alias c="clear"
alias numFiles='echo $(ls -1 | wc -l)'
alias tarball="tar -czvf"
alias untarball="tar -xzvf"
# client shortcuts
alias modelhorseuniversity="cd ~/code/clients/MHU/websites/model-horse-university/"
# eza
alias ll="eza --color=always --long --git --icons=always --all"
alias ls="eza --color=always --git --icons=always --all"
# lazygit
alias lg="lazygit"
# zoxide
unalias cd 2>/dev/null
alias cd="z"
# ----END-------------------------------------------

# ==================================================
# TOOL CONFIGURATIONS
# ----START-----------------------------------------
# fzf
eval "$(fzf --zsh)"
# github 
eval "$(gh copilot alias -- zsh)"
# ghostty
export GHOSTTY_CONFIG="$HOME/.config/ghostty/config"
# starship
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init zsh)" 
# zoxide
eval "$(zoxide init zsh)"
# ----END-------------------------------------------

# ==================================================
# FUNCTIONS
# ----START-----------------------------------------
#
# ----END-------------------------------------------


# ==================================================
# INJECTED CONFIGURATIONS
# ----START-----------------------------------------
