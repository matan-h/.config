# If you come from bash you might have to change your $PATH.
export PATH="/opt/android-sdk/cmdline-tools/latest/bin:/opt/android-sdk/emulator:$HOME/.local/share/gem/ruby/3.0.0/bin:$HOME/.cargo/bin/:$HOME/node_modules/.bin/:$PATH"
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
if [[ -n "$ZSH_CUSTOM_THEME" ]]
then
    ZSH_THEME="$ZSH_CUSTOM_THEME"
else
    # Set name of the theme to load --- if set to "random", it will
    # load a random theme each time oh-my-zsh is loaded, in which case,
    # to know which specific one was loaded, run: echo $RANDOM_THEME
    # See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
    ZSH_THEME="agnoster"
fi
# seopt
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt autocd                                                   # if only directory path is entered, cd there.
setopt inc_append_history                                       # save commands are added to the history immediately, otherwise only when shell exits.
setopt histignorespace                                          # Don't save commands that start with space


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
LANG=en_US.utf8
# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
ZSH_WEB_SEARCH_ENGINES=(
    archwiki "https://wiki.archlinux.org/index.php?search="
    gmail "https://mail.google.com/mail/u/0/#search/"
)
plugins=(git-extras colored-man-pages command-not-found encode64 extract sudo fzf yarn copypath archlinux gh web-search copyfile copybuffer dirhistory httpie aliases)
# git-extras,completion,archlinux,encode64,httpie - completion and aliases
# colored-man-pages   add color to man
# command-not-found   provide suggested packages (using pkgfile)
# extract             add extract command
# sudo                add "sudo" to last command by pressing esc twice.
# fzf                 add fzf key bindings
# copypath            userful command to copy of directory or pwd to clipboard
# web-search          aliases for searching with google,youtube,archwiki,gmail
# copypath            copy file contents to clipboard
# copybuffer          ctrl+o to copy the currently typed command
# dirhistory          keyboard shortcuts for navigating directory history (alt+LEFT go to previous directory,etc)
# aliases             add "acs" command to show all aliases sorted by categories

# source arch zsh-syntax-highlighting and autosuggestions
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh


# disable arch run-help and enable zsh run-help
autoload -Uz run-help
(( ${+aliases[run-help]} )) && unalias run-help
alias help=run-help

export MANPAGER="less -R --use-color -Dd+r -Du+b" # color man
# export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
# eval `keychain -q --eval --agents ssh id_ed25519 --nogui --noask --agents ssh,gpg`  # git
eval $(keychain --eval --quiet --noask --nogui ~/.ssh/id_ed25519)  # git

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
source "$HOME/.aliases"
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# up function (from https://github.com/shannonmoeller/up/)
source "$HOME/.config/up/up.sh"

export EDITOR="nvim"
export ANDROID_SDK_ROOT=$HOME/Android/Sdk
export SEC="/usr/share/seclists" # path to seclists
export NVM_DIR="/usr/share/nvm";

alias nvm='unalias nvm; [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && . "$NVM_DIR/nvm.sh";nvm'
# bind ctrl+backspace to delete previous word
bindkey '^H' backward-kill-word
eval "$(zoxide init zsh)"


# alias z="unalias z; eval \"\$(zoxide init zsh)\";z"
