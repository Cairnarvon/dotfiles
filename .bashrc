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

# Prettier prompt
PS1='[\[\e[2m\]$(date +%H:%M)\[\e[0m\]] ${debian_chroot:+($debian_chroot)}\[\e[1;31m\]\u@\h\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\]\$ '
PS2='\[\e[2m\]> \[\e[0m\]'

# Colours for ls
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
fi

# Environment variablies
export HISTCONTROL=ignoreboth
export KOPIPEDIR=~/.kopipe      # kopipe(1)
export PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin:/bin:/home/cairnarvon/bin:/usr/local/sicstus4.1.2/bin
export CDPATH=$CDPATH:.:~:~/Desktop:~/codans
export EDITOR=vim
export GIT_EDITOR=vim
export GIT_PAGER=less

# Misc aliases
alias mv='mv -i'
alias cp='cp -i'
alias vi='vim'
alias py2html='pygmentize -f html -O full,style=native'
alias backup='rsync -a --delete --progress /home/cairnarvon /media/disk/'
alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"
alias progscrape='/home/cairnarvon/codans/python/progscrape/progscrape.py --json --verify-trips --aborn --progress-bar /home/cairnarvon/prog.db'

# bash-builtins(7)
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
