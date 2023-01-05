# if you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/davidbeauchamp/.oh-my-zsh

ZSH_THEME="robbyrussell"

DISABLE_AUTO_UPDATE="true"

COMPLETION_WAITING_DOTS="true"

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

#~~~~~EXPORTS~~~~~~
export EDITOR=nvim
export LC_ALL="en_US.UTF-8"
export PATH=/usr/local/sbin:$PATH
export PATH=$PATH:~/bin
export PATH=~/.bin:$PATH

# go
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin
export GOPATH=~/workspace/go

export PGDATA=~/pgdata

# NVM
export NVM_DIR="/Users/davidbeauchamp/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# tmuxp
export DISABLE_AUTO_TITLE='true'

autoload -U promptinit; promptinit
prompt pure

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#~~~~~ALIASES~~~~~
alias ..="cd .."
alias ...="cd ../.."
alias ls="ls -GFA"

# tmux
alias kill-session="tmux kill-session -t"

# Git
alias st="git status -sb"
alias log="git log --pretty=oneline --abbrev-commit --graph --decorate --all"
alias co="git checkout"
alias branch="git branch"
alias gpom="git pull origin master"

# Rails
alias b="bundle exec"

# nvim all the way
alias vi="nvim"
alias vim="nvim"

