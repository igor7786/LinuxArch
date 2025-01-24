#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

unpack() {
    if [ -z "$1" ]; then
        echo "Usage: unpack <file>"
        return 1
    fi

    case "$1" in
        *.tar.bz2)  tar xjf "$1"    ;;  # Extract tar.bz2
        *.tar.gz)   tar xzf "$1"    ;;  # Extract tar.gz
        *.tar.xz)   tar xJf "$1"    ;;  # Extract tar.xz
        *.bz2)      bunzip2 "$1"    ;;  # Extract bz2
        *.rar)      unrar x "$1"    ;;  # Extract rar
        *.gz)       gunzip "$1"     ;;  # Extract gz
        *.tar)      tar xf "$1"     ;;  # Extract tar
        *.tbz2)     tar xjf "$1"    ;;  # Extract tbz2
        *.tgz)      tar xzf "$1"    ;;  # Extract tgz
        *.zip)      unzip "$1"      ;;  # Extract zip
        *.Z)        uncompress "$1" ;;  # Extract Z
        *.7z)       7z x "$1"       ;;  # Extract 7z
        *.xz)       unxz "$1"       ;;  # Extract xz
        *) echo "'$1' cannot be extracted via unpack()" ;;
    esac
}
# alias pycharm='/opt/pycharm-professional/bin/pycharm.sh'
# export PATH="$PATH:/opt/pycharm-professional/bin"
