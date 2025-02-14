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
# tmux
alias tmux="tmux -f ~/.config/tmux/tmux.conf"
# docker
alias dcd="docker-compose down"
# ----END-------------------------------------------
