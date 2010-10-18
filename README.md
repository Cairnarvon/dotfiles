These are my dotfiles hello.

There's not much here, but someone asked, and it's useful to have these available online. The easiest way to install them yourself is to clone the repository and use GNU `make`:

>     git clone git://github.com/Cairnarvon/dotfiles ~/.dotfiles
>     cd ~/.dotfiles
>     make

This will automatically create symlinks in the necessary places, prompting to remove your old crap as needed. If you want install individual files, use `make` targets `vimrc`, `bashrc`, or `wmiirc` as desired.

Suggestions or requests welcome.
