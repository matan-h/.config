# my dotfiles

dotfiles managed by [git](https://stackoverflow.com/a/64548852)

* [config.fish](.config/fish/config.fish) - Simple fish startup file: helpful (and colorful) `fish_greeting`, source the `.aliases.fish` file [if exist], and bind some standard keybindings

* [.aliases.fish](.aliases.fish) - fish functions (`alias`,`function` and `abbr`).

| alias                  | definitions                                                                      |
| ---------------------- | -------------------------------------------------------------------------------- |
| `uvenv`                | create a venv, activate it,then update pip wheel setuptool                       |
| `myip`                 | get the current local IP address                                                 |
| `gitp`                 | `git pull`                                                                       |
| `lstime`               | list files sorted by modification time (using `eza` if you have, or using `ls`.) |
| `clipcopy`,`clippaste` | copy/paste text to the clipboard (both wayland and x11)                          |
| `start`,`kstart`       | start file in normal application (`kstart` uses kde command line)                |

and many more


