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
plugins=(aws git python scala sbt asdf gcloud golang helm kubectl docker docker-compose flutter web-search ssh-agent composer zsh-autosuggestions zsh-syntax-highlighting zsh-nvm)

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

if [[ -d $HOME/.asdf ]]; then
	[[ -s "$HOME/.asdf/asdf.sh" ]] && source "$HOME/.asdf/asdf.sh"

	prog_list=('erlang' 'elixir' 'java' 'scala' 'gradle' 'dart' 'flutter' 'nodejs' 'rust' 'ruby' 'python' 'terraform')

	for prog in $prog_list; do
		[[ ! -d "$HOME/.asdf/plugins/$prog" ]] && asdf plugin add $prog 
		if [[ ! -d "$HOME/.asdf/installs/$prog" ]]; then
			if [[ $prog == "java" ]]; then
				asdf install $prog openjdk-19
				asdf global $prog openjdk-19
			elif [[ $prog == "python" ]]; then
				asdf install $prog latest
				asdf global $prog latest
			else
				asdf install $prog latest
				asdf global $prog latest
			fi

			if [[ $prog == "dart" ]]; then
				pub global activate fvm
			fi
		fi
	done
	source $HOME/.asdf/plugins/java/set-java-home.zsh	
else
        git clone https://github.com/asdf-vm/asdf.git ~/.asdf
fi

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

if [[ -d $HOME/.cargo ]]; then
	[[ -s "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"
else
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

if [[ -d $HOME/.rye ]]; then
	[[ -s "$HOME/.rye/env" ]] && source "$HOME/.rye/env"
else
	curl -sSf https://rye.astral.sh/get | bash
fi


[[ -s "$HOME/.shenv" ]] && export SHENV_ROOT="$HOME/.shenv"
[[ -s "$HOME/.shenv" ]] && export PATH="$SHENV_ROOT/bin:$PATH"
[[ -s "$HOME/.local/zed.app" ]] && export PATH=$HOME/.local/bin:$PATH

[[ -s "$HOME/.phpvm/current/default" ]] && export PATH="$PATH:$HOME/.phpvm/current/default/bin"

if [ -s "$HOME/Android/Sdk" ]; then
	export ANDROID_HOME="$HOME/Android/Sdk"
	export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
fi


## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/ygpark2/.dart-cli-completion/zsh-config.zsh ]] && . /home/ygpark2/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

