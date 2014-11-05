#echo "loading .bashrc"
source ~/.profile

# Bash customisations to be syncronised between machines.
export PS1='\[\e[1;34m\][\u@\h \W]\$\[\e[0m\] '

# History
export HISTCONTROL=erasedups	# when adding an item to history, delete itentical commands upstream
export HISTSIZE=10000		# save 10000 items in history
shopt -s histappend		# append history to ~\.bash_history when exiting shell

# Lazy aliases
alias l='ls -l'
alias la='ls -Al'
alias ..='cd ..'
alias tree='tree -C'
alias trls='tree -C | less -R'	# -C outputs colour, -R makes less understand color
alias mode='(set -o | grep emacs.*on >/dev/null 2>&1 && echo "emacs mode" || echo "vi mode")'

# Rails aliases
alias sc='./script/console'
alias sg='./script/generate'
alias ss='./script/server'
alias sp='./script/server -e production'
alias t='rake spec'
alias ta='autotest -rails'
alias m='rake db:migrate'

# SVN aliases
alias svnadd="svn st | grep '^\?' | awk '{print $2}' | xargs svn add"
alias svnrmd="svn st | grep '^\!' | awk '{print $2}' | xargs svn rm"

# git aliases
# http://joeyates.info/2010/08/29/use-g-as-an-alias-for-git-without-losing-autocompletion/
alias g='git'

if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
  source /usr/local/etc/bash_completion.d/git-completion.bash
fi

# Vim aliases
alias rvim='mvim --remote-silent '

# Set terminal colors when launching screen
alias tmux="TERM=screen-256color-bce tmux"

# Functions
# Fuzzy cd
# Usage:
#    cdf public
# Changes to repos-public directory.
# http://dpaste.org/P59h/
function cdf() {
  cd *$1*/
}

# Reload .bashrc
alias refresh='. ~/.bashrc'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH=/Developer/Applications/Sencha:$PATH
export PATH=/Developer/Applications/Sencha/command:$PATH
export PATH=/Developer/Applications/Sencha/jsbuilder:$PATH

export PATH=/Developer/Applications/SenchaSDKTools-2.0.0-beta3:$PATH

export SENCHA_SDK_TOOLS_2_0_0_BETA3="/Applications/SenchaSDKTools-2.0.0-beta3"

export PATH=/Applications/SenchaSDKTools-2.0.0-beta3:$PATH

export PATH=/Applications/Postgres.app/Contents/MacOS/bin:$PATH

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

function ps1_branch {
  b=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  if [ -n "$b" ]; then echo " $b"; fi
}

black="\[\e[30m\]"
red="\[\e[31m\]"
green="\[\e[32m\]"
yellow="\[\e[33m\]"
blue="\[\e[34m\]"
magenta="\[\e[35m\]"
cyan="\[\e[36m\]"
white="\[\e[37m\]"
reset="\[\e[0m\]"

