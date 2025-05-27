# config.nu
#
# Installed by:
# version = "0.104.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.

$env.config.show_banner = false

# Import config modules
source ~/.config/nushell/config-modules/tools.nu # must be first
source ~/.config/nushell/config-modules/aliases.nu
source ~/.config/nushell/config-modules/settings.nu

# Local config
source ~/.config/nushell/config-modules/local.nu

# Source OS-specific config file if it exists
if ($nu.os-info.name | str starts-with "macos") {
  source ~/.config/nushell/config-modules/os-specific/mac.nu
} else if ($nu.os-info.name | str starts-with "linux") {
  source ~/.config/nushell/config-modules/os-specific/linux.nu
} else if ($nu.os-info.name | str starts-with "windows") {
  source ~/.config/nushell/config-modules/os-specific/windows.nu
}