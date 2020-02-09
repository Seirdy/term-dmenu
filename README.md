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

The main script is `term-dmenu` and its dependency `floating-terminal`. `term-dmenu`
is a dmenu replacement that turns stdin into an interactive menu and sends output
back to stdout. In other words, if you don't use any of dmenu's CLI options, you can
probably just `alias dmenu=term-dmenu` and you'll be just fine.

Helper scripts work with `term-dmenu`. If you set the environment variable
`$DMENU_PROGRAM` to something else (e.g. `dmenu` or `rofi -dmenu`), the helper
scripts will use those programs instead.

- `dmenu-runner` can run any executable in your `$PATH`. Because of the large number
  of executables on most systems, recent entries are saved and prioritized to make
  searching easier.
- `app-launcher` launches desktop applications using `j4-dmenu-desktop`
- `window-switcher` allows listing/filtering/selecting open windows in Sway or i3
  (much like what Alt+TAB does on most desktop environments).

Dependencies
------------

- FZF
- `j4-dmenu-desktop` for `app-launcher`
- `window-switcher` requires Sway or i3 to be running

Configuration
-------------

If you don't want to use `term-dmenu` but would like to use some of the helper
scripts

Differences from similar implementations
----------------------------------------

Other projects attempting to replace dmenu/rofi with terminal emulators exist, most
notably [sway-launcher-desktop](https://github.com/Biont/sway-launcher-desktop). I
created my own project instead of contributing upstream because I had different
goals:

- Modularity: split dmenu functionality into `term-dmenu`, and make helper scripts
  work with dmenu, rofi, and term-dmenu equally well.
- 100% POSIX shell compatibility; no bashisms. Running these scripts with `dash`
  (the Debian Almquist shell) should yield faster startup speed.
- `app-launcher` uses `j4-dmenu-desktop` to find .desktop files, which is better
  than using shell/AWK expressions.
- `floating-terminal` launches the terminal. If the environment variable
  `$FLOATING_TERMINAL` is unset, it runs the first of the following programs that is
  found in `$PATH`:
  1.  `havoc $@`
  2.  `alacritty --class=launcher -e $@`
  3.  `kitty --class=launcher -e $@`
  4.  `konsole -e $@`
  5.  `gnome-terminal -e $@`
  6.  `termite -e $@`
  7.  `st -c launcher -e $@`
  8.  `xterm -e $@`

Acknowledgements
----------------

`dmenu-runner` code is based on [this
script](https://gitlab.com/FlyingWombat/my-scripts/blob/a0cb5717777c1587af381004aa8fb048206bee55/sway-launcher)
by FlyingWombat ([Wayback
Machine](https://web.archive.org/web/20200209122744/https://gitlab.com/FlyingWombat/my-scripts/blob/a0cb5717777c1587af381004aa8fb048206bee55/sway-launcher),
[archive.today](https://archive.today/yHFrW)), with inspiration from
[`dmenu_run_history`](https://tools.suckless.org/dmenu/scripts/dmenu_run_with_command_history/).

Many bits of code were borrowed from the discussion in [issue
1367](https://github.com/swaywm/sway/issues/1367) of Sway's GitHub issue tracker.
