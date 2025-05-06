# Homebrew
$env.PATH = ($env.PATH | split row (char esep) | prepend '/opt/homebrew/bin')

# Zoxide
if not ($"~/.zoxide.nu" | path expand | path exists) {
  zoxide init nushell | save --raw ~/.zoxide.nu
}
source ~/.zoxide.nu