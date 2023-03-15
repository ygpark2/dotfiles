# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster" # "materialshell"

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
plugins=(autoenv aws git python scala sbt asdf gcloud golang helm kubectl docker docker-compose flutter web-search ssh-agent composer zsh-autosuggestions zsh-syntax-highlighting zsh-nvm zsh-sdkman)

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
	export PYENV_ROOT="$HOME/.pyenv"
	export PATH="$PYENV_ROOT/bin:$PATH"
	eval "$(pyenv init --path)"
	# eval "$(pyenv init -)"
	eval "$(pyenv virtualenv-init -)"
	# source $HOME/.pyenv/plugins/pyenv-autoenv/bin/pyenv-autoenv
	# source virtualenvwrapper.sh
else
	curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
	pyenv install `pyenv install --list | grep "^ \+[3-9]\.[0-9]\.[0-9]$" | tail -n 1`
fi

if [[ -d $HOME/.rvm ]]; then
	export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
	[ -s "$HOME/.rvm/scripts/rvm" ] && . "$HOME/.rvm/scripts/rvm"  # This loads rvm
else
	curl -sSL https://get.rvm.io | bash -s stable  --ruby
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

if [[ -d $HOME/.dvm ]]; then
	[[ -s "$HOME/.dvm/scripts/dvm" ]] && source "$HOME/.dvm/scripts/dvm"
	[[ -d "$HOME/.pub-cache/bin" ]] && export PATH="$PATH":"$HOME/.pub-cache/bin"
else
	git clone https://github.com/cbracken/dvm.git $HOME/.dvm
	[[ -s "$HOME/.dvm/scripts/dvm" ]] && source "$HOME/.dvm/scripts/dvm"
	dvm install `dvm listall | grep "^[2-9]\.[[:digit:]]\.[[:digit:]]$" | tail -1`
	dvm use `dvm list | grep "^[2-9]\.[[:digit:]]\.[[:digit:]]$" | tail -1`
	pub global activate fvm
fi

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

if [[ -d $HOME/.tfenv ]]; then
  [[ -d "$HOME/.tfenv/bin" ]] && export PATH="$HOME/.tfenv/bin:$PATH"
else
	git clone https://github.com/tfutils/tfenv.git $HOME/.tfenv
fi


if [[ -d $HOME/.cargo ]]; then
	[[ -s "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"
else
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi


[[ -s "$HOME/.shenv" ]] && export SHENV_ROOT="$HOME/.shenv"
[[ -s "$HOME/.shenv" ]] && export PATH="$SHENV_ROOT/bin:$PATH"

[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

[[ -s "$HOME/.phpvm/current/default" ]] && export PATH="$PATH:$HOME/.phpvm/current/default/bin"

# PHPVM_BIN="$HOME/bin/phpvm"
# MY_PHP_VERSION='5.6.27'
# alias php="$("$PHPVM_BIN" bin "$MY_PHP_VERSION")/php"
# alias composer="php $("$PHPVM_BIN" bin "$MY_PHP_VERSION")/composer.phar"

# jabba installation
[[ -s "$HOME/.jabba/jabba.sh" ]] && source "$HOME/.jabba/jabba.sh"

if [ -s "$HOME/Android/Sdk" ]; then
	export ANDROID_HOME="$HOME/Android/Sdk"
	export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
fi


[[ -s "/home/ygpark2/.gvm/scripts/gvm" ]] && source "/home/ygpark2/.gvm/scripts/gvm"
