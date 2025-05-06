# ==================================================
# FILE OPERATIONS
# --------------------------------------------------
def numFiles [] { ls | length }

alias cp = cp -iv
alias mv = mv -iv
alias less = less -FSRXc
alias c = clear
alias rgl = rg -L

# ==================================================
# ARCHIVE OPERATIONS
# --------------------------------------------------
alias tarball = tar -czvf
alias untarball = tar -xzvf

# ==================================================
# MODERN REPLACEMENTS
# --------------------------------------------------
alias cd = z
alias ll = ls -l
alias l = eza --color=always --color=auto --long --git --icons=always --all

# ==================================================
# DEVELOPMENT TOOLS
# --------------------------------------------------
# Editors and Git
alias nv = neovim
alias lg = lazygit
alias ld = lazydocker
alias tmux = tmux -f ~/.config/tmux/tmux.conf
alias zj = zellij
alias yz = yazi

# ==================================================
# PROJECT SHORTCUTS
# --------------------------------------------------
alias modelhorseuniversity = cd ~/code/clients/MHU/websites/model-horse-university/