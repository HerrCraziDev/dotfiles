

# ZSH Config 
# - HerrCrazi's Dotfiles - <herrcrazi@gmail.com>

export ZSH="$HOME/.oh-my-zsh"

if [ -d $ZSH ]; then
	ZSH_THEME="robbyrussell"
	COMPLETION_WAITING_DOTS="true"
	DISABLE_UNTRACKED_FILES_DIRTY="true"
	HIST_STAMPS="dd/mm/yyyy"
	plugins=(git lxd-completion-zsh)

	source $ZSH/oh-my-zsh.sh
fi

# Personal prompt
if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then 
	c_host='%F{99}%M%f'
else
	c_host='%F{cyan}%m%f'
fi
export PROMPT="%F{yellow}[ %F{green}%B%n%F{yellow}@$c_host %F{blue}%~%b %F{yellow}] %(!.%F{red}.%F{yellow})%B$%b%f "

export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

#Load personal term dotfiles
source "$HOME/.termrc"


# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _approximate _prefix
zstyle ':completion:*' expand prefix
zstyle ':completion:*' file-sort name
zstyle ':completion:*' ignore-parents parent
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '+m:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+m:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=** r:|=**' '+m:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' '+m:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' max-errors 3
zstyle ':completion:*' menu select=long
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' squeeze-slashes true
zstyle :compinstall filename '/home/glrf/.zshrc'

# Prevent suggesting items already present
zstyle ':completion:*:rm:*' ignore-line yes
zstyle ':completion:*:mv:*' ignore-line yes
zstyle ':completion:*:cp:*' ignore-line yes

# Complete 'sudo' - add root paths
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin


# Load completion
autoload -Uz compinit
compinit
# End of lines added by compinstall

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt autocd beep notify
bindkey -e
# End of lines configured by zsh-newuser-install

# Disable zsh globbing error messages, leave it to the called program
setopt +o nomatch

# Enable immediate completion (also remove '_list' from zstyle completion section above)
setopt menu_complete

