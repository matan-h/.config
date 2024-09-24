# my dotfiles

dotfiles managed by [git](https://stackoverflow.com/a/64548852)

* [config.fish](/.config/fish/config.fish) - Simple fish startup file: helpful (and colorful) `fish_greeting`, source the `.aliases.fish` file [if exist], and bind some standard keybindings

* [.aliases.fish](/.aliases.fish) - fish functions (`alias`,`function` and `abbr`).

| alias                  | definitions                                                                      |
| ---------------------- | -------------------------------------------------------------------------------- |
| `uvenv`                | create a venv, activate it,then update pip wheel setuptool                       |
| `myip`                 | get the current local IP address                                                 |
| `gitp`                 | `git pull`                                                                       |
| `lstime`               | list files sorted by modification time (using `eza` if you have, or using `ls`.) |
| `clipcopy`,`clippaste` | copy/paste text to the clipboard (both wayland and x11)                          |
| `start`,`kstart`       | start file in normal application (`kstart` uses kde command line)                |
| `cls`,`ren`, `mkdirs`  | allow you to type simple commands from windows                                   |

and many more

All functions, is built in a way that you get only what you have (e.g. if you dont have python, you wouldnt get all the python aliases, etc.)

* [install.fish](/.dotfiles/install.fish) - a simple, short installer that install fisher, the fzf plugin and the tilde prompt.



## Installation
Clone the repo, remove the local changes, install fish and its dependencies, and reload the shell.
```bash
# clone the repo
git clone --bare https://github.com/matan-h/.config ~/.dotfiles/git
# restore the files (the local changes is set to deletion mode)
git --git-dir=~/.dotfiles/git  --work-tree=$HOME reset --hard
# install fish dependencies
fish ~/.dotfiles/install.fish
# reload fish
exec fish
```
