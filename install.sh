#/usr/bin/env sh


if [[ -d ~/dotfiles/emacs.d && -d ~/dotfiles/oh-my-zsh ]]; then
	echo "emacs.d and oh-my-zsh submodule exist!"
else
	git submodule init
	git submodule update
fi

if [[ -h ~/.oh-my-zsh ]]; then
	echo ".oh-my-zsh exist!"
else
	ln -s ~/dotfiles/oh-my-zsh ~/.oh-my-zsh
fi

if [[ -h ~/.emacs.d ]]; then
	echo ".emacs.d exist!"
else
	ln -s ~/dotfiles/emacs.d ~/.emacs.d
fi

if [[ -h ~/.zshrc ]]; then
	echo ".zshrc exist!"
else
	ln -s ~/dotfiles/zshrc ~/.zshrc
fi

if [[ -d ~/dotfiles/emacs.d/personal ]]; then
	echo "emacs personal directory exist!"
else
	mkdir ~/dotfiles/emacs.d/personal
	cp personal/* emacs.d/personal/
fi

if [[ -d ~/dotfiles/emacs.d/emms ]]; then
	echo "emacs emms directory exist!"
else
	mkdir ~/dotfiles/emacs.d/emms
fi

