#!/usr/bin/make

all: install

install: vimrc bashrc git wmiirc

vimrc bashrc gitconfig gitignore:
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
