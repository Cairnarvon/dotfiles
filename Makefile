#!/usr/bin/make

all: install

install: vimrc bashrc muttrc git X canto

vimrc bashrc gitconfig gitignore xinitrc Xresources muttrc:
	@[ -e ~/.$@ ] && rm -i ~/.$@ || true
	@[ ! -e ~/.$@ ] \
		&& (ln -fs "`pwd`/.$@" ~/.$@ && echo ".$@ installed.") \
		|| echo ".$@ skipped."

git: gitconfig gitignore

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
