
# Add '~/bin' to the $PATH
export PATH="$HOME/bin:$PATH"

# Load the shell dotfiles
for file in ~/.{aliases,functions} do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Show the current directory name in the tab
if [ $ITERM_SESSION_ID ]; then
  export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"; ':"$PROMPT_COMMAND";
fi

export PS1="\\w[\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)]\$ "
export PATH="$HOME/.rbenv/shims:/usr/local/bin:$PATH"
export RAILS_ENV="development"
export EDITOR="subl -w"

ulimit -n 10000

eval "$(rbenv init -)"

# Erase duplicates in history
export HISTCONTROL=erasedups
# Store 10k history entries
export HISTSIZE=10000
# Append to the history file when exiting instead of overwriting it
shopt -s histappend
# Autocorrect typos in path names when using `cd`
shopt -s cdspell;