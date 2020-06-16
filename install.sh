#/usr/bin/env sh

if [ -d ~/dotfiles/emacs.d ] && [ -d ~/dotfiles/oh-my-zsh ]; then
	echo "emacs.d and oh-my-zsh submodule exist!"
else
	git submodule init
	git submodule update
fi

if [ -d $HOME/dotfiles/zsh/hosts/$HOST ]; then
	echo "$HOST folder is already installed!"
else
	mkdir -p $HOME/dotfiles/zsh/hosts/$HOST
	touch $HOME/dotfiles/zsh/hosts/$HOST/zshrc
fi

if [ -d ~/.autoenv ] ; then
	echo "autoenv is already installed!"
else
	git clone git://github.com/kennethreitz/autoenv.git ~/.autoenv
fi

if [ -f ~/dotfiles/oh-my-zsh/custom/themes/materialshell-dark.zsh-theme ] ; then
	echo "materialshell theme is already installed!"
else
	curl -L -o ~/dotfiles/oh-my-zsh/custom/themes/materialshell.zsh-theme https://raw.githubusercontent.com/carloscuesta/materialshell/master/materialshell.zsh
fi

if [ -d ~/dotfiles/oh-my-zsh/custom/plugins/zsh-syntax-highlighting ] ; then
        echo "plugins zsh-syntax-highlighting is already installed!"
else
	git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

if [ -d ~/dotfiles/oh-my-zsh/custom/plugins/zsh-autosuggestions ] ; then
        echo "plugins zsh-autosuggestions is already installed!"
else
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
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

if [ -L ~/.xsessionrc ]; then
	echo ".xsessionrc symbolic link exist!"
else
	ln -s ~/dotfiles/xsessionrc ~/.xsessionrc
fi

if [ -d ~/dotfiles/emacs.d/emms ]; then
	echo "emacs emms directory exist!"
else
	mkdir ~/dotfiles/emacs.d/emms
fi

