#!/usr/bin/make

all: install

install: vim bashrc muttrc mailcap git X canto ghci login_conf ssh

vimrc bashrc gitconfig gitignore xinitrc Xresources muttrc mailcap ghci login_conf:
	@[ -e ~/.$@ ] && rm -i ~/.$@ || true
	@[ ! -e ~/.$@ ] \
		&& (ln -fs "`pwd`/.$@" ~/.$@ && echo ".$@ installed.") \
		|| echo ".$@ skipped."

git: gitconfig gitignore

vim: vimrc
	@[ -d ~/.$@ ] && rm -ri ~/.$@ || true
	@[ ! -e ~/.$@ ] \
		&& (ln -fs "`pwd`/.$@" ~/.$@ && echo ".$@ installed.") \
		|| echo ".$@ skipped."

wmiirc:
	@[ ! -d ~/.wmii ] && mkdir ~/.wmii || true
	@[ -e ~/.wmii/wmiirc ] && rm -i ~/.wmii/wmiirc || true
	@[ ! -e ~/.wmii/wmiirc ] \
		&& (ln -fs "`pwd`/.wmii/wmiirc" ~/.wmii/wmiirc && echo ".wmii/wmiirc installed.") \
		|| echo ".wmii/wmiirc skipped."

canto:
	@[ ! -d ~/.canto ] && mkdir ~/.canto || true
	@[ -e ~/.canto/conf.py ] && rm -i ~/.canto/conf.py || true
	@[ ! -e ~/.canto/conf.py ] \
		&& (ln -fs "`pwd`/.canto/conf.py" ~/.canto/conf.py && echo ".canto/conf.py installed.") \
		|| echo ".canto/conf.py skipped."

X: xinitrc Xresources wmiirc

ssh:
	@[ ! -d ~/.ssh ] && mkdir ~/.ssh || true
	@[ -e ~/.ssh/config ] && rm -i ~/.ssh/config || true
	@[ ! -e ~/.ssh/config ] \
		&& (ln -fs "`pwd`/.ssh/config" ~/.ssh/config && echo ".ssh/config installed.") \
		|| echo ".ssh/config skipped."
	@cat .ssh/authorized_keys >>~/.ssh/authorized_keys && echo ".ssh/authorized_keys installed."
