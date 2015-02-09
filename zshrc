# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

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
plugins=(rails git python scala sbt rvm ruby cloudapp coffee node web-search ssh-agent)

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
