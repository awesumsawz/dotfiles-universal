$env.HOMEBREW_BREWFILE = $"{$env.HOME}/.config/brewfile/brewfile"
$env.DYLD_FALLBACK_LIBRARY_PATH = $"(^brew --prefix)/lib:{$env.DYLD_FALLBACK_LIBRARY_PATH}"
$env.PATH = ([$env.HOME + '/.config/herd-lite/bin', $env.HOME + '/.local/bin'] | append $env.PATH | uniq)
$env.PHP_INI_SCAN_DIR = $"{$env.HOME}/.config/herd-lite/bin:{$env.PHP_INI_SCAN_DIR}"