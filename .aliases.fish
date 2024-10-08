# from my aliases
abbr chx 'chmod +x'
# python apps:
# venv:
if command -q python
    alias venv "source venv/bin/activate.fish" # activate python virtualenv
    alias cvenv "python -m venv venv" # create python virtualenv
    alias uvenv "cvenv && venv && python -m pip install pip setuptools wheel -U" # create python virtualenv,activate it, and upgrade it
    abbr py python
end

# batcat -> bat
if command -q batcat && not command -q bat
    alias bat batcat
end

# dnf:
if command -q dnf || command -q apt
    if command -q dnf
        set pm dnf
    else
        set pm apt
    end
    abbr {$pm}in "sudo $pm install" # install package
    abbr {$pm}up "sudo $pm upgrade" # upgrade system
    abbr "{$pm}rm" "sudo $pm remove" # Remove Package with all its dependencies
    abbr {$pm}se "$pm search" # search for package remotely
    abbr {$pm}seq "$pm list --installed" # search for package locally

    abbr "{$pm}?" "$pm list --installed|grep" # grep package locally
    abbr "{$pm}??" "$pm list|grep" # grep package online and offline

    if [ "$pm" = apt ]
        abbr aptinf "apt show"
        abbr aptfile "dpkg -S"
        function aptinfo
            apt show $argv | bat -pl yml
        end
    else
        abbr dnfinf "dnf info" # get info on package remotely
        abbr dnfinfq "dnf info --installed" # get info on package locally
        abbr "dnf???" "dnf list --available|grep" # grep package only online    
        abbr dnffile "rpm -qf" # Determining which Package Owns a File
        function dnfinfo
            dnf info $argv | bat -pl yml
        end
    end


end
# aliases:linux system
if command -q ps
    abbr find_proc "ps -aux | grep" # search the list of processes
end

alias del 'mv --force -t ~/.local/share/Trash ' # same, with alias like windows

if command -q dmesg
    abbr dmesg "sudo dmesg" # automatically add sudo to dmesg
    abbr "dmesg?" "sudo dmesg | grep -C 10" # grep the kernel message in 10 line after and before
end

# using rsync as cp/mv with progress.
if command -q rsync
    alias cpr "rsync --archive -hh --partial --info=stats1,progress2 --modify-window=1"
    alias mvr "rsync --archive -hh --partial --info=stats1,progress2 --modify-window=1 --remove-source-files"
end

# wayland
if [ "$XDG_SESSION_TYPE" = wayland ] && command -q wl-copy
    alias clipcopy wl-copy
    alias clippaste wl-paste

else if [ "$XDG_SESSION_TYPE" = x11 ] && command -q xclip
    alias clipcopy 'xclip -sel clip'
    alias clippaste 'xclip -sel clip -o'
end

# KDE
if command -q kioclient
    alias kstart "kioclient exec --noninteractive"
    abbr start. "kstart ." # exec file maneger
    abbr kstart. "kstart ."
else
    abbr start. 'start .'
end
# Gnome


# simple shortcuts
if command -q micro
    abbr mc micro
end

if command -q helix
    abbr hx helix
end


function copydir -a folder
    if not set -q folder[1]
        set folder (pwd)
    else
        set folder (readlink --canonicalize $folder)
    end
    echo $folder | clipcopy
    echo $folder
end

# fix common mistakes and typeos
abbr copypath copydir
abbr sl ls
abbr l ls
abbr "cd.." "cd .."

if command -q ssh
    abbr shh ssh
end

# git
if command -q git
    abbr gitam "git commit -am" #   Auto stage all modified files and commit
    abbr gitp 'git pull' # pull chenges from the server
    abbr g 'git ' # one letter for git
end

# better linux
if command -q eza
    alias ls eza
    alias tree="eza --tree"

    abbr lsgit "eza --git-ignore"
    abbr lstime "eza -l --sort=modified"
    abbr ll "eza -la"
else
    alias ls="ls -h --color=auto"
    abbr lsgit "git ls-files"
    abbr lstime "ls -halt"
    abbr ll "ls -lhA"
end

alias mv 'mv -iv'
alias rm 'rm -Iv'
alias cp 'cp -iv'

alias df 'df -h' # Human-readable sizes
alias free 'free -h' # Human-readable sizes
alias du "du -c -h" # Human-readable sizes and total size

if command -q grc
    alias lsblk "grc lsblk -o name,mountpoint,label,size,fstype,uuid" # show more info in color
end
# zsh like commands
function take
    mkdir -pv $argv
    cd $argv
end
alias fishrc="exec fish"

# manage dotfiles - so:a:64548852
export DOTFILES_GIT="$HOME/.dotfiles/git"
alias dotfiles 'git --git-dir=$DOTFILES_GIT --work-tree=$HOME' # so:a:64548852
alias dotfiles-init "git init --bare $DOTFILES_GIT && dotfiles config --local status.showUntrackedFiles no" # so:a:64548852 + so:a:65847027
alias fishconfig "kate ~/.config/fish/config.fish ~/.aliases.fish"
alias dotconfig "codium ~/.config/fish/config.fish ~/.aliases.fish ~/.github/README.md ~/.dotfiles/install.fish"

# fish shell
abbr where type
if 	printf '%s\n' 3.6 $version | sort --check=silent --version-sort # check if fish version is greater then 3.6
    abbr --set-cursor=% what "bat (which %)"
else
    function what
        bat (which $argv)
    end
end

function 'alias?'
    alias | grep "$argv"
end
# alias "alias?" "alias | grep"

functions -c history old_history
alias history 'PAGER="bat --file-name \"fish history\" -l fish" old_history' # enable syntax highlighting in fish history pager. see (my) unix.stackexchange.com/q/778285

# windows like commands
alias start xdg-open # xdg-open:linux is "open":mac or "start":windows

abbr ren mv # rename file is actually moving it to another name
abbr cls clear

abbr mkdirs "mkdir -pv" # Create directories recursively with verbose
abbr md mkdir
abbr rd rmdir
abbr rmtree "rm -r" # remove folder recursively
if command -q bandwhich
    abbr bandwhich "sudo bandwhich" # bandwhich only work with sudo.
end
# macos like (not much - just to use navi-style commands )
abbr pbcopy clipcopy
abbr pbpaste clippaste

# hooks
abbr '$' "" # simple hook for copy/paste like "$ apt install ..."

# zoxide (j=c=z)
if command -q zoxide
    abbr j z
    abbr c z
end

# find a file to beep
set -l file
for file in '/usr/share/sounds/ocean/stereo/service-login.oga' '/usr/share/sounds/linuxmint-login.wav'
    if test -r $file
        break
    end
end

if command -q ffplay && test -r $file
    alias beep "ffplay -nodisp -autoexit -nostats -hide_banner $file" # play a sound as alert music
end


set -l term
if command -q kosnole
    set term konsole
else if command -q gnome-terminal
    set term gnome-terminal
end

if set -q term
    abbr term "$term & disown" # create new konsole windows
end

# adb
set -l adb_shell_project "$HOME/projects/adb-shell/adb-shell.sh"
if command -q adb && test -r "$adb_shell_project"
    alias adb-shell "$adb_shell_project"
end


# net
if command -q nmcli
    alias net-connected-full "nmcli -f STATE -t" # show full internet information
    alias net-connected "nmcli -f STATE -t g" # show only internet status
    alias net-trace "nmcli -f STATE -t m" # trace internet status chenges
end

function myip # get my ip in one command. ported from gh:ohmyzsh/ohmyzsh:systemadmin
    if command -q ip
        ip addr | awk '/inet /{print $2}' | grep -v 127.0.0.1
    else
        ifconfig | awk '/inet /{print $2}' | grep -v 127.0.0.1
    end
end
if command -q nmap
    abbr netscan 'sudo nmap -sn -4 (myip)' # scan the network for devices
end

# ctf
if command -q strings
    abbr stringsx "strings -n 7 -t x " # strings only lines with 7+ readable and print offset
end
if command -q trid
    alias trid='LANG="" trid' # trid not work with $LANG
    abbr filex trid # program sometimes better then file in binary files
end
if command -q pngcheck
    alias pngcheck "pngcheck -tp7" # print more then the normal pngcheck
end


# mono commands:
if command -q mono
    function monoc -a filename
        mcs -out:program.exe $filename && mono program.exe
    end
end
# web dev:
if command -q yarn
    alias yst 'yarn start'
    alias ya 'yarn add'
end

# flutter
if command -q flutter
    alias flpub 'flutter pub'
    alias flrun 'flutter run'
end
