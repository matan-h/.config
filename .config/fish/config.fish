# env:
set -U --append fish_features qmark-noglob # disable the "?" glob
# add to path
# set -x PATH "$HOME/bin" $PATH
function add_path
    test -r $argv && fish_add_path $argv
end
add_path $HOME/.cargo/bin

add_path $HOME/.flutter/sdk/flutter/bin
add_path $HOME/Android/Sdk/cmdline-tools/latest/bin


add_path $HOME/.deno/bin

# add android/flutter to path.
add_path $HOME/Android/Flutter/bin
export ANDROID_HOME="$HOME/Android/Sdk"
add_path $ANDROID_HOME/cmdline-tools/latest/bin
add_path $ANDROID_HOME/emulator
add_path $ANDROID_HOME/build-tools/latest


# just using export instead of set -gx because it's easier.
export LESS="-RSM~gIsw" # ansi color inside less (blog.0x1fff.com/posts/2009/2009-11-17-linux-tip-color-enabled-pager-less) [gh:yangchenyun/fish-config]

export LANG=en_US.utf8
command -q micro && export EDITOR=micro

export SEC="/usr/share/seclists" # path to seclists
# learn more at consoledonottrack.com
export DO_NOT_TRACK=1

if status is-interactive
    # Commands to run in interactive sessions can go here

    # aliases
    test -r ~/.aliases.fish && source ~/.aliases.fish

    # bind ctrl+backspace to delete previous word
    bind \cH backward-kill-word
    # bind ctrl+del to delete the next word
    bind \e\[3\;5~ kill-word

    # addons
    if command -q zoxide
        zoxide init fish | source # add zoxide
    end


    set fish_greeting Welcome to (set_color cyan)fish(set_color normal), the friendly interactive shell\nUndo: (set_color green)ctrl+/(set_color normal)
    if set -q _fish_hide_prompt
        # hide fish_greeting
        set -g fish_greeting
    end
end
