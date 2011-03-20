These are my dotfiles hello.

There's not much here, but someone asked, and it's useful to have these available online. The easiest way to install them yourself is to clone the repository and use GNU `make`:

>     git clone git://github.com/Cairnarvon/dotfiles ~/.dotfiles
>     cd ~/.dotfiles
>     make

This will automatically create symlinks in the necessary places, prompting to remove your old crap as needed. If you want install individual files, use `make` targets `vimrc`, `bashrc`, `git` (or `gitconfig` and `gitignore` separately), `X` (or `wmiirc`, `xinitrc`, and `Xresources` separately), `canto`, or `muttrc` as desired.

Suggestions or requests welcome.

(`wmii` is a [tiling window manager](http://wmii.suckless.org/). `canto` is a [`curses` RSS reader](http://codezen.org/canto/)).
