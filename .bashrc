# Load the shell dotfiles
for file in ~/dotfiles/.{aliases,functions,bash_prompt}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file


# Show the current directory name in the tab
if [ $ITERM_SESSION_ID ]; then
  export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"; ':"$PROMPT_COMMAND";
fi

# git prompt string
export PS1="\\w[\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)]\$"

# paths
export PATH=/usr/local/sbin:$PATH
export PATH=$PATH:~/bin
export PATH=~/.bin:$PATH
export PATH=$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

# rails
export RAILS_ENV=development

# Erase duplicates in history
export HISTCONTROL=erasedups
# Store 10k history entries
export HISTSIZE=10000
# Append to the history file when exiting instead of overwriting it
shopt -s histappend
# Autocorrect typos in path names when using `cd`
shopt -s cdspell
# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

ulimit -n 1000
