#!/usr/bin/make

all: install

install: vimrc bashrc git wmiirc

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

git:
	@[ -e ~/.gitconfig ] && rm -i ~/.gitconfig || true
	@[ ! -e ~/.gitconfig ] \
		&& (ln -fs "`pwd`/.gitconfig" ~/.gitconfig && echo ".gitconfig installed.") \
		|| echo ".gitconfig skipped."
	@[ -e ~/.gitignore ] && rm -i ~/.gitignore || true
	@[ ! -e ~/.gitignore ] \
		&& (ln -fs "`pwd`/.gitignore" ~/.gitignore && echo ".gitignore installed.") \
		|| echo ".gitignore skipped."

wmiirc:
	@[ ! -d ~/.wmii ] && mkdir ~/.wmii || true
	@[ -e ~/.wmii/wmiirc ] && rm -i ~/.wmii/wmiirc || true
	@[ ! -e ~/.wmii/wmiirc ] \
		&& (ln -fs "`pwd`/.wmii/wmiirc" ~/.wmii/wmiirc && echo ".wmii/wmiirc installed.") \
		|| echo ".wmii/wmiirc skipped."
