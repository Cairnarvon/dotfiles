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
    [ -z "$(which git)" ] && return

    CURRENT_BRANCH=$(git branch --no-color 2>/dev/null | sed -n 's/^\* \(.*\)$/\1/p')

    if [ ! -z "$CURRENT_BRANCH" ]; then
        DOTS=$(git status 2>/dev/null | \
               awk 'BEGIN { ORS="" }                    \
                    /^# Changes to be committed:$/      \
                        { print "\\[\\e[1;34m\\]●\\[\\e[0m\\] " } \
                    /^# Changes not staged for commit:$/ \
                        { print "\\[\\e[1;31m\\]●\\[\\e[0m\\] " }')
        echo -n "[ \\[\\e[1;33m\\]$CURRENT_BRANCH\\[\\e[0m\\] $DOTS] "
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
    lfser)
        PS_COL="\e[1;36m"   # cyan!
        ;;
    *)
        PS_COL="\e[1;34m"   # blue!
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


# Gmail notifier thing
gmailchecker()
{
    # If Gmail can be reached and has unread messages, display a notification

    local GMAIL_USER=$(head -n 1 ~/.gmail 2>/dev/null)
    local GMAIL_PASS=$(tail -n 1 ~/.gmail 2>/dev/null)

    if [ ! -z "$GMAIL_USER" ]; then
        GMESS=$(wget -q -O - --http-user="$GMAIL_USER"        \
                             --http-password="$GMAIL_PASS"    \
                     https://mail.google.com/mail/feed/atom | \
                sed -n 's#<fullcount>\([0-9]*\)</fullcount>#\1#p')

        if [ -z "$GMESS" ]; then
            echo -n "Gmail unreachable" | wmiir create /rbar/gmail
        elif [ "$GMESS" -eq 1 ]; then
            echo -n "1 new message" | wmiir create /rbar/gmail
        elif [ ! "$GMESS" -eq 0 ]; then
            echo -n "$GMESS new messages" | wmiir create /rbar/gmail
        else
            wmiir remove /rbar/gmail 2>/dev/null
        fi
    else
        echo "~/.gmail does not exist. Status bar not updated."
    fi
}

muttnupdate()
{
    mutt $@
    gmailchecker
}

# Colours for ls and grep
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto --group-directories-first -x'
    alias grep='grep --color'
else
    alias ls='ls --group-directories-first -x'
fi

# Environment variablies
export HISTCONTROL=ignoreboth
export HISTSIZE=1000000
export KOPIPEDIR=~/.kopipe      # kopipe(1)
export PATH=~/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/local/sbin:/usr/sbin:/sbin:/bin
export CDPATH=.:~:~/codans
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
alias mutt='muttnupdate'

# bash-builtins(7)
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
