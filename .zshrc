

# ZSH Config 
# - HerrCrazi's Dotfiles - <herrcrazi@gmail.com>

export ZSH="$HOME/.oh-my-zsh"

if [ -d $ZSH ]; then
	ZSH_THEME="robbyrussell"
	COMPLETION_WAITING_DOTS="true"
	DISABLE_UNTRACKED_FILES_DIRTY="true"
	HIST_STAMPS="dd/mm/yyyy"
	plugins=(git)

	source $ZSH/oh-my-zsh.sh
fi

# Personal prompt
export PROMPT="%F{yellow}[ %F{green}%B%n%F{yellow}@%F{cyan}%m %F{blue}%~%b %F{yellow}] %(!.%F{red}.%F{yellow})%B$%b%f "

export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

#Load personal term dotfiles
source "$HOME/.termrc"
