# Path to your oh-my-zsh configuration.
ZSH=$HOME/dotfiles/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="materialshell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(rails git python scala sbt rvm ruby cloudapp coffee node web-search ssh-agent composer)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

source $HOME/dotfiles/zsh/aliases
source $HOME/dotfiles/zsh/options
source $HOME/dotfiles/zsh/keybindings
source $HOME/dotfiles/zsh/functions

# Setup virtualenv wrapper
export WORKON_HOME=$HOME/.virtualenvs
# source $HOME/bin/virtualenvwrapper_bashrc
# source /opt/local/bin/virtualenvwrapper_bashrc-2.6

# Load OS specific settings
[[ $OSTYPE == darwin*  && -f $HOME/dotfiles/zsh/darwin/zshrc  ]] && source $HOME/dotfiles/zsh/darwin/zshrc
[[ $OSTYPE == linux*   && -f $HOME/dotfiles/zsh/linux/zshrc   ]] && source $HOME/dotfiles/zsh/linux/zshrc
[[ $OSTYPE == solaris* && -f $HOME/dotfiles/zsh/solaris/zshrc ]] && source $HOME/dotfiles/zsh/solaris/zshrc
[[ $OSTYPE == freebsd* && -f $HOME/dotfiles/zsh/freebsd/zshrc ]] && source $HOME/dotfiles/zsh/freebsd/zshrc
[[ $OSTYPE == cygwin*  && -f $HOME/dotfiles/zsh/cygwin/zshrc  ]] && source $HOME/dotfiles/zsh/cygwin/zshrc

# Load host specific settings
[[ -f $HOME/dotfiles/zsh/hosts/$HOST/zshrc ]] && source $HOME/dotfiles/zsh/hosts/$HOST/zshrc

if [[ -d $HOME/.pyenv/bin ]]; then
	export PATH="$HOME/.pyenv/bin:$PATH"
	eval "$(pyenv init -)"
	eval "$(pyenv virtualenv-init -)"
	# source $HOME/.pyenv/plugins/pyenv-autoenv/bin/pyenv-autoenv
	# source virtualenvwrapper.sh
else
	curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
	pyenv install `pyenv install --list | grep "^ \+[3-9]\.[0-9]\.[0-9]$" | tail -n 1`
fi

if [[ -d $HOME/.nvm ]]; then
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
else
	curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.26.1/install.sh | bash
	nvm install stable
fi

if [[ -d $HOME/.rvm ]]; then
	export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
	[ -s "$HOME/.rvm/scripts/rvm" ] && . "$HOME/.rvm/scripts/rvm"  # This loads rvm
else
	curl -sSL https://get.rvm.io | bash -s stable  --ruby
fi

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
if [[ -d $HOME/.sdkman ]]; then
	[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
else
	curl -s get.sdkman.io | bash
	sdk install scala
	sdk install groovy
	sdk install grails
	sdk install gradle
	sdk install springboot
fi

[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

[[ -s "$HOME/.phpvm/current/default" ]] && export PATH="$PATH:$HOME/.phpvm/current/default/bin"

# PHPVM_BIN="$HOME/bin/phpvm"
# MY_PHP_VERSION='5.6.27'
# alias php="$("$PHPVM_BIN" bin "$MY_PHP_VERSION")/php"
# alias composer="php $("$PHPVM_BIN" bin "$MY_PHP_VERSION")/composer.phar"

# jabba installation
[[ -s "$HOME/.jabba/jabba.sh" ]] && source "$HOME/.jabba/jabba.sh"

# autoenv installation
[[ -s "$HOME/.autoenv/activate.sh" ]] && source "$HOME/.autoenv/activate.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
