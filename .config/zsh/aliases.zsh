# ==================================================
# FILE OPERATIONS
# --------------------------------------------------
alias cp='cp -iv'        # Interactive and verbose copy
alias mv='mv -iv'        # Interactive and verbose move
alias mkdir='mkdir -pv'  # Create parent dirs, verbose
alias less='less -FSRXc' # Better less defaults
alias c="clear"
alias numFiles='echo $(ls -1 | wc -l)'
alias rgl="rg -L"

# ==================================================
# ARCHIVE OPERATIONS
# --------------------------------------------------
alias tarball="tar -czvf"
alias untarball="tar -xzvf"

# ==================================================
# MODERN REPLACEMENTS
# --------------------------------------------------
# Replace ls with eza
alias l="eza --color=always --color=auto --long --git --icons=always"
alias ll="eza --color=always --color=auto --long --git --icons=always --all"
alias ls="eza --color=always --color=auto --git --icons=always --all"

# Replace cd with zoxide
unalias cd 2>/dev/null
alias cd="z"

# ==================================================
# DEVELOPMENT TOOLS
# --------------------------------------------------
# Editors and Git
alias nv="nvim"
alias lg="lazygit"
alias ld="lazydocker"

# Docker
alias dcd="docker-compose down"

# Terminal Multiplexers
alias tmux="tmux -f ~/.config/tmux/tmux.conf"
alias zj="zellij"

# AI Assistant
alias chat="tgpt --key '$(op item get 'rgxhrxsbuaqgr4gur4vfnbamx4' --fields 'credential' --reveal)' --provider 'openai' --model 'gpt-3.5-turbo'"

# ==================================================
# PROJECT SHORTCUTS
# --------------------------------------------------
alias modelhorseuniversity="cd ~/code/clients/MHU/websites/model-horse-university/"
