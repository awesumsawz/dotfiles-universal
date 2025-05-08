# Starship
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
# $env.STARSHIP_CONFIG = ("~/.config/starship/starship.toml" | path expand)

# Neovim
$env.config.buffer_editor = "nvim"

# Yazi
def --env y [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
	yazi ...$args --cwd-file $tmp
	let cwd = (open $tmp)
	if $cwd != "" and $cwd != $env.PWD {
		cd $cwd
	}
	rm -fp $tmp
}

# Zoxide
if (not ($"~/.zoxide.nu" | path expand | path exists)) {
  zoxide init nushell | save --raw ~/.zoxide.nu
}
source ~/.zoxide.nu

# Vi module 
$env.config.edit_mode = 'vi'
