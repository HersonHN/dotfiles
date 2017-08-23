### UTF-8 support
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8


### coloring
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad


### shortcuts
alias cd..="cd .."
alias v="vim"
alias g="git"
alias vi="vim"
alias cls="clear"
alias rr="rm -rf"
alias rb="ruby"
alias py="python"
alias js="node"

### quit command
alias q="exit"
alias :q="exit"
alias :wq="exit"
alias ,q="exit"
alias ZZ="exit"

### helpers

# activate virtualenv
activate () {
  source env/bin/activate
}

# create a folder and enter it
md () {
  mkdir "$1"
  cd "$1"
}

### override ls
if [[ `uname` == 'Darwin' ]]; then
  alias ls="ls -G"
else
  alias ls="ls --group-directories-first --color=auto"
fi


### aliases to external files
export PATH="$PATH:~/dotfiles/bin:~/bin"


### Load the extras
source ~/dotfiles/extras/marks.sh
source ~/dotfiles/extras/prompt.sh


