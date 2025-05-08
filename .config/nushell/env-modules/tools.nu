# Homebrew
$env.PATH = ($env.PATH | split row (char esep) | prepend '/opt/homebrew/bin')

# starship
$env.STARSHIP_CONFIG = ("~/.config/starship/starship.toml" | path expand)

# neovim
$env.EDITOR = "nvim"