#/usr/bin/env sh

if [ -d ~/.autoenv ] ; then
	echo "autoenv is already installed!"
else
	git clone git://github.com/kennethreitz/autoenv.git ~/.autoenv
fi

if [ -f ~/dotfiles/oh-my-zsh/themes/materialshell-dark.zsh-theme ] ; then
	echo "materialshell theme is already installed!"
else
	curl -L -o /tmp/master.zip https://github.com/carloscuesta/materialshell/archive/master.zip
	unzip -u -d /tmp /tmp/master.zip
	cp /tmp/materialshell-master/zsh/* ~/dotfiles/oh-my-zsh/themes/
fi


if [ -d ~/dotfiles/emacs.d ] && [ -d ~/dotfiles/oh-my-zsh ]; then
	echo "emacs.d and oh-my-zsh submodule exist!"
else
	git submodule init
	git submodule update
fi

if [ -L ~/.oh-my-zsh ]; then
	echo ".oh-my-zsh symbolic link exist!"
else
	ln -s ~/dotfiles/oh-my-zsh ~/.oh-my-zsh
fi

if [ -L ~/.emacs.d ]; then
	echo ".emacs.d symbolic link exist!"
else
	ln -s ~/dotfiles/emacs.d ~/.emacs.d
fi

if [ -L ~/.zshrc ]; then
	echo ".zshrc symbolic link exist!"
else
	ln -s ~/dotfiles/zshrc ~/.zshrc
fi

if [ -L ~/dotfiles/emacs.d/personal ]; then
	echo "emacs personal symbolic link exist!"
else
	ln -s ~/dotfiles/personal ~/dotfiles/emacs.d/personal
fi

if [ -d ~/dotfiles/emacs.d/emms ]; then
	echo "emacs emms directory exist!"
else
	mkdir ~/dotfiles/emacs.d/emms
fi

