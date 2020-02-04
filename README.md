term-dmenu
==========

[![GitLab](https://img.shields.io/badge/repository-GitLab-orange.svg?logo=gitlab)](https://gitlab.com/Seirdy/term-dmenu)
[![GitHub
mirror](https://img.shields.io/badge/mirror-GitHub-black.svg?logo=github)](https://github.com/Seirdy/term-dmenu)

A replacement for Rofi, dmenu, and other launchers that uses FZF and a plain-old
terminal emulator.

I recommend altering these scripts to suit your preferences.

What's inside
-------------

- `term-dmenu` is a dmenu replacement that turns stdin into an interactive menu and
  sends output back to stdout. In other words, you can probably just
  `alias dmenu=term-dmenu` and you'll be just fine.
- `sway-launcher` can run any executable in your `$PATH`. Because of the large
  number of executables on most systems, recent entries are saved and prioritized to
  make searching easier.
- `app-launcher` launches desktop applications using `j4-dmenu-desktop`
- `window-switcher` allows listing/filtering/selecting open windows in Sway (much
  like what Alt+TAB does on most desktop environments).

Dependencies
------------

- FZF
- `j4-dmenu-desktop` for `app-launcher`
- `window-switcher` and `sway-launcher` require Sway to be running

`sway-launcher` is meant to be run inside SwayWM; altering it to remove this
dependency is trivial. Shebang lines can be changed to point to any POSIX-compatible
shell (e.g. `/bin/bash` if `/usr/bin/env` or `dash` are not present on your system.

Differences from similar implementations
----------------------------------------

The main difference is fast startup time.

- These scripts use the shebang line `#!/usr/bin/env dash` because the Debian
  Almquist Shell has the fastest startup time. I didn't use any dash-specific
  features (e.g. `local`) or Bashisms; syntax is pure POSIX shell.
- `floating-terminal` launches the terminal. By default, it launches
  [havoc](https://github.com/ii8/havoc) because it has the fastest startup time on
  Wayland of any other Wayland-native terminal emulator I tested.

Acknowledgements
----------------

`sway-launcher` code is based on [this
script](https://gitlab.com/FlyingWombat/my-scripts/blob/a0cb5717777c1587af381004aa8fb048206bee55/sway-launcher)
by FlyingWombat.

Many bits of code were borrowed from the discussion in [issue
1367](https://github.com/swaywm/sway/issues/1367) of Sway's GitHub issue tracker.
