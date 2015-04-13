
# Add '~/bin' to the $PATH
export PATH="$HOME/bin:$PATH"

# Load the shell dotfiles
for file in ~/.{aliases,functions}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Show the current directory name in the tab
if [ $ITERM_SESSION_ID ]; then
  export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"; ':"$PROMPT_COMMAND";
fi

# git prompt string
export PS1="\\w[\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)]\$ "

# Rails
export RAILS_ENV="development"
export PATH="$HOME/.rbenv/shims:/usr/local/bin:$PATH"
eval "$(rbenv init -)"

# Sublime as editor
export EDITOR="sublime -w"

# Erase duplicates in history
export HISTCONTROL=erasedups
# Store 10k history entries
export HISTSIZE=10000
# Append to the history file when exiting instead of overwriting it
shopt -s histappend
# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

ulimit -n 10000