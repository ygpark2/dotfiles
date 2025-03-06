#/usr/bin/env sh

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

if [ -d $HOME/dotfiles/zsh/hosts/$HOST ]; then
	echo "$HOST folder is already installed!"
else
	mkdir -p $HOME/dotfiles/zsh/hosts/$HOST
	touch $HOME/dotfiles/zsh/hosts/$HOST/zshrc
fi

if [ -L ~/.oh-my-zsh ]; then
	echo ".oh-my-zsh symbolic link exist!"
else
	ln -s ~/dotfiles/oh-my-zsh ~/.oh-my-zsh
fi

# ==================== install oh-my-zsh theme ================
if [ -d ~/dotfiles/oh-my-zsh/custom/themes ]; then
	echo "custome themes folder is already existed!"
else
	mkdir ~/dotfiles/oh-my-zsh/custom/themes/
fi

if [ -f ~/dotfiles/oh-my-zsh/custom/themes/materialshell.zsh-theme ] ; then
	echo "materialshell theme is already installed!"
else
	curl -L -o ~/dotfiles/oh-my-zsh/custom/themes/materialshell.zsh-theme https://raw.githubusercontent.com/carloscuesta/materialshell/master/materialshell.zsh
fi

# ==================== install oh-my-zsh plugins ================
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

if [ -d ~/dotfiles/oh-my-zsh/custom/plugins/zsh-nvm ] ; then
        echo "plugins zsh-nvm is already installed!"
else
	git clone https://github.com/lukechilds/zsh-nvm ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-nvm
fi

if [ -d ~/dotfiles/oh-my-zsh/custom/plugins/zsh-sdkman ] ; then
        echo "plugins zsh-sdkman is already installed!"
else
	git clone https://github.com/matthieusb/zsh-sdkman ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-sdkman
fi
# ==================== End of installation oh-my-zsh plugins ================

if [ -L ~/.emacs.d ]; then
	echo ".emacs.d symbolic link exist!"
else
	ln -s ~/dotfiles/emacs.d ~/.emacs.d
fi

if [ -d ~/dotfiles/emacs.d/personal ]; then
	echo "emacs personal symbolic link exist!"
else
	cp ~/dotfiles/personal/* ~/dotfiles/emacs.d/personal/
fi

if [ -d ~/dotfiles/emacs.d/emms ]; then
	echo "emacs emms directory exist!"
else
	mkdir ~/dotfiles/emacs.d/emms
fi

if [ -L ~/.zshrc ]; then
	echo ".zshrc symbolic link exist!"
else
	ln -s ~/dotfiles/zshrc ~/.zshrc
fi

if [ -L ~/.xsessionrc ]; then
	echo ".xsessionrc symbolic link exist!"
else
	ln -s ~/dotfiles/xsessionrc ~/.xsessionrc
fi
