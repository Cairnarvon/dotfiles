[ -z "$PS1" ] && return

# bash-builtins(7)
shopt -s checkwinsize
shopt -s hostcomplete
shopt -u interactive_comments
shopt -s histappend
shopt -s histverify
shopt -s shift_verbose          # Only because I write a lot of bash scripts

# ↑ and ↓ behave more usefully with partial commands
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# lessopen(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# Never needed this before, but it can't hurt
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Fancy fancy for git repositories
git.statusline ()
{
    CURRENT_BRANCH=$(git-branch --no-color 2>/dev/null | sed -n 's/^\* \(.*\)$/\1/p')

    if [ ! -z "$CURRENT_BRANCH" ]; then
        DOTS=$(git-status -q 2>/dev/null | \
               awk 'BEGIN { ORS="" }                    \
                    /^# Changes to be committed:$/      \
                        { print "\\[\\e[1;34m\\]●\\[\\e[0m\\] " } \
                    /^# Changed but not updated:$/      \
                        { print "\\[\\e[1;31m\\]●\\[\\e[0m\\] " }')
        echo -en "[ \\[\\e[1;33m\\]$CURRENT_BRANCH\\[\\e[0m\\] $DOTS] "
    fi
}

# Prettier prompt

case "`hostname`" in
    feynman)
        PS_COL="\e[1;31m"   # red!
        ;;
    madoka)
        PS_COL="\e[1;32m"   # green!
        ;;
    fermi)
        PS_COL="\e[1;33m"   # yellow!
        ;;
    einstein)
        PS_COL="\e[1;0m"    # white!
        ;;
    *)
        PS_COL="\e[1;44m"   # blue!
        ;;
esac

if [ "`whoami`" == "root" ]; then
    PS1_PRE='\n             ________\n     /\_/\  / \['$PS_COL'\]\h\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\] '
    PS1_POST='\n    ( ´-\`) <\n   /    |   \\\[________\e[A\e[8D\]'
    PROMPT_COMMAND='PS1=$PS1_PRE$(git.statusline)$PS1_POST'
else
    PS1_BASE='[\[\e[2m\]$(date +%H:%M)\[\e[0m\]] \['$PS_COL'\]\u@\h\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\]\$ '
    PROMPT_COMMAND='PS1=$(git.statusline)$PS1_BASE'
fi

PS2='\[\e[2m\]> \[\e[0m\]'


# Colours for ls and grep
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias grep='grep --color'
fi

# Environment variablies
export HISTCONTROL=ignoreboth
export KOPIPEDIR=~/.kopipe      # kopipe(1)
export PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin:/bin:~/bin
export CDPATH=$CDPATH:.:~:~/Desktop:~/codans
export EDITOR=vim
export GIT_EDITOR=vim
export GIT_PAGER=less

# Misc aliases
alias mv='mv -i'
alias cp='cp -i'
alias vi='vim'
alias py2html='pygmentize -f html -O full,style=native'
alias backup='rsync -a --delete --progress ~'
alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"
alias progscrape='progscrape --json --verify-trips --aborn --progress-bar ~/prog.db'

# bash-builtins(7)
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
