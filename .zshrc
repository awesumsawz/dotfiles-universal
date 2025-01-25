#   OS SPECIFIC SETTINGS
#   ---------------------------------------
if [[ "$OSTYPE" == "linux"* ]]; then
  export PATH=/usr/bin:$PATH
  [[ -f ~/.zsh_linux ]] && source ~/.zsh_linux
elif [[ "$OSTYPE" == "darwin"* ]]; then
  export PATH="$HOME/.local/bin:$PATH"
  [[ -f ~/.zsh_mac ]] && source ~/.zsh_mac
  [[ -f ~/.zsh_knight && $HOSTNAME == Knight* ]] && source ~/.zsh_knight
fi

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

#   OH MY ZSH
#   -------------------------
export ZSH="$HOME/.oh-my-zsh"
zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 13
COMPLETION_WAITING_DOTS="true"
source $ZSH/oh-my-zsh.sh
export ARCHFLAGS="-arch $(uname -m)"
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  docker 
  docker-compose
)

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

#   Client Web Shortcuts
#   ---------------------------------------
alias modelhorseuniversity="cd ~/code/clients/MHU/websites/model-horse-university/"

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

#   DOCKER
#   ---------------------------------------
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

#   EVALs
#   ---------------------------------------
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"