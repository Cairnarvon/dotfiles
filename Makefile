#!/usr/bin/make

all: install

install: vimrc bashrc wmiirc

vimrc:
	@[ -e ~/.vimrc ] && rm -i ~/.vimrc || true
	@[ ! -e ~/.vimrc ] \
		&& (ln -fs "`pwd`/.vimrc" ~/.vimrc && echo ".vimrc installed.") \
		|| echo ".vimrc skipped."

bashrc:
	@[ -e ~/.bashrc ] && rm -i ~/.bashrc || true
	@[ ! -e ~/.bashrc ] \
		&& (ln -fs "`pwd`/.bashrc" ~/.bashrc && echo ".bashrc installed.") \
		|| echo ".bashrc skipped."

wmiirc:
	@[ ! -d ~/.wmii ] && mkdir ~/.wmii || true
	@[ -e ~/.wmii/wmiirc ] && rm -i ~/.wmii/wmiirc || true
	@[ ! -e ~/.wmii/wmiirc ] \
		&& (ln -fs "`pwd`/.wmii/wmiirc" ~/.wmii/wmiirc && echo ".wmii/wmiirc installed.") \
		|| echo ".wmii/wmiirc skipped."
