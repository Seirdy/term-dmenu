term-dmenu
==========

[![sourcehut]](https://git.sr.ht/~seirdy/term-dmenu)
[![GitLab
mirror](https://img.shields.io/badge/mirror-GitLab-orange.svg?logo=gitlab)](https://gitlab.com/Seirdy/term-dmenu)
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

[sourcehut]: https://img.shields.io/badge/repository-sourcehut-lightgrey.svg?logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAIAAAACACAMAAAD04JH5AAACPVBMVEUAAAD///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////9qcjBRAAAAvnRSTlMAAQIDBAUGBwgJCgsMDg8QERITFBUWFxgZGhscHR4fICEjJCYnKCkqKy0vMDM0NTY3ODk7PD1AQUNERkdISUtMTU5PUFFUV1hZWltcXV5fYGFkZmdoaW1ucHF0dXd4ent+f4CBgoOEhYaHiImKjZOUm5yeoaKjpKanqKmqq6ytsLGys7S2t7i6vL2+v8LDxMXGx8jJyszNzs/R0tPV1tjZ29/g4uPk5ebn6Orr7O3u7/Dx8vT19vf4+fr7/P3+A3PI6QAABcFJREFUGBntwflbVFUABuBvYtE0GWcgNUtCccncwzRU1KlwX3Mpc0vFBNtUzMowEFEJxRItAR0FN3AHNFBm5vvb+uWcO8u9M3PvnXN6np6H98WQIUOG/E/lf7hp/5Ha5tabHR03W5trj+zbON+P/8iw+Xvru2jh/uk9JbnQbMxn9S+YwvO6zQXQ5vV158NMK3xu9XDoUPTdM9r05NtCqPbeT2E6EDo+BSq9eyJCh8LVE6DKG1UDdKH/65FQ4pO7dOnOcmQu/1da6mo6un/bykBZWWDVtgNHL3TT0i9+ZGjxA5oMXqxYko8EBWUHm0M06SpFJrIOMVF/zYo8JOFdeWqACSIVWXDNd54J2rbkISXv1jYmOOuFSxNvMV7DAg/S8iw8y3jBIrgy8yHjNMyETbPPMU73DLhQ0sdYbQvhQOl1xuqZC8dKnjPGix3ZcCRn5z+M0TcPDs3sY4zmiXBs0p+M0fM+HJn4kFGRfVlwIbsiwqjuIjjgu8WoZ4vgUlkPo4Je2JZ1nlEdxXBtaiejGrJg1yFGXXsTGRjbxqgDsGkxo656kRHf3zRESmFLwQMarnmRIV87DV1+2PErDR1vImPjOmn4GTZ8SsOzYigwrZeGANJ64x6lyCIosYyGOyORThUN+6BIJQ2VSKPoJaXmLCiSfZnSQCFSO0HpxUQoU9xPqRopvRehtAMK7aIUnoJUfqLUlg2FcoKUqpFCUZjSQii1hFJoApL7jlID1PL8Tukwknr9GaWZUOwDSo+GIZl1lBqgXCOlFUjmPKUFUG4RpTNIYkyYQpsHynluUAj5Ye0zSlugwXZKG2GtnkJ/HjTwvaTwGywNe0GhBlrUUujLgZX5lFZAi7WU5sLKXgqDedDCF6awE1bqKVyEJi0UTsFKF4UKaFJF4TYs5FNaAk2WUcqD2YeU8qHJOEpzYLaJQhd08TyisAZm+yk0QZtLFHbD7AiFo9DmOIUfYFZLYT+0qaRwEmbNFLZBmy8oNMKslcJKaLOBQgvMblIIQJtyCu0w66BQBm0CFIIw66BQBm0CFIIwu0khAG3KKbTDrJXCKmizgUILzJopbIM2Oyg0wqyWwgFoU0XhJMyOUDgKbX6k8D3M9lG4AG0uUdgFs40UuqGL5zGF1TCbT6kAmrxFaTbM/JTKoMlySqNg4T6Fg9DkMIVOWDlNoRmaXKFQAyt7KIS80MIfofAlrJRQWgkt1lGaAyu5zymcghZ1FHqzYek0hQEvNPC/olADa5spbYUGn1NaD2sFYQptHijnCVIYHI0kzlFaCOUWU6pDMqspnYVyTZTKkczwJ5RmQ7ESSg9zkdS3lM5BLU8TpUokVxii9BGUWkppcDxSOE7peg4Uyr1F6RhSmRKmtBMK7aEUKkZK1ZT+mQRlJg9QOobUJvRT+iMbiuRcpdT/DtL4moYKKPINDQeRzsg7lCJlUOJjGm6PQFoBGnqmQoHpfTQshQ2/0NA5Fhl7+y4NJ2CHv4uGNh8ylH+DhnujYUtphIa/fMhIfisN4QWwqYJR7eOQgfE3GPUV7Mo6y6jOaXBt+l1GnX4NtnmDjOpdBpc+7mPU9VFwoOgBYxzKhgs53zDG/UI4MqOHMS4Xw7HJVxnj6XQ4NK+PMfp35cCR3D0DjNE7C47N62Gs4BLY51l6i7GezoILM7oZ5/cPYFNJE+Pcnw5XioKM17jIg7Q8i5sY73ohXPI2MMGN7T6k5P88yAT1o+BaVkWECV7WrvUhCf+6uldMEP7qNWSitIsm4ZaqZWMRz/PW8sNXIjS5twAZ8v9MS48uHa/8YkN5IFC+YUfVj5ce09KJ0chc4A5dur0USoysHKAL/QdHQJXC6jAdCh97BypNqQ7RgcFjxVBtwuFHtOlh5XjoMGzFmRDTGqwrz4U2/o2/9TGF3pr1o6FZztydp27TQmfNl3Oy8R/Jm7Nm9w8nG1vag8H2lsaT3+9aPXsUhgwZMuT/6V/RenbAjLiafgAAAABJRU5ErkJggg==
