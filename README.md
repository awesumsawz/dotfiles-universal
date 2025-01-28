# DOTFILES

https://draculatheme.com/oh-my-posh

# ZSHRC

## DEPENDENCIES

My local setup is built on ZSH at the moment, so start there.
Additionally, I have several packages installed that are referenced in the file:

### System Packages (brew, pacman, dnf)

- bat
- neovim
- docker
- eza
- fzf
- zoxide
- ghostty
- stow
- ripgrep
- lazygit
- bottom
- starship
  - Reliant on installing a nerdfont
  - https://www.nerdfonts.com/font-downloads

### Manual Installation

- oh-my-zsh
- zsh-autosuggestions
- zsh-syntax-highlighting
- copilot cli
- github cli
- docker rootless
- lazydocker

### NPM

- treesitter cli
- vite

## NOTES

### GHOSTTY SSH FIX

https://github.com/ghostty-org/ghostty/discussions/3911

### ASTROVIM INSTALL

#### OPTIONAL TOOLS FROM ASTROVIM INSTALL:

- tree-sitter (npm)
- ripgrep (brew)
- lazygit (brew)
- gdu-go (brew)
- bottom (brew)

### COMMANDS USED DURING INSTALLATION

- mv ~/.local/share/nvim ~/.local/share/nvim.bak
- mv ~/.local/state/nvim ~/.local/state/
- git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
