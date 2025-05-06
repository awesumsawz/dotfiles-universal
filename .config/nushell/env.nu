# env.nu
#
# Installed by:
# version = "0.104.0"
#
# Previously, environment variables were typically configured in `env.nu`.
# In general, most configuration can and should be performed in `config.nu`
# or one of the autoload directories.
#
# This file is generated for backwards compatibility for now.
# It is loaded before config.nu and login.nu
#
# See https://www.nushell.sh/book/configuration.html
#
# Also see `help config env` for more options.
#
# You can remove these comments if you want or leave
# them for future reference.


let base_paths = [
  '/usr/bin'
  '/bin'
  '/usr/sbin'
  '/sbin'
  '/opt/homebrew/bin'
  '/opt/homebrew/sbin'
]

load-env { PATH: ($env.PATH | append $base_paths | uniq) }

source ~/.config/nushell/env-modules/local.nu
source ~/.config/nushell/env-modules/mac.nu
source ~/.config/nushell/env-modules/tools.nu
source ~/.config/nushell/env-modules/plugins.nu