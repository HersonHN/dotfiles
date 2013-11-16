### UTF-8 support ###

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8



### coloring ###

export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad


### le vi mode
# set -o vi


### Lazy's man shortcuts

alias v="vim"
alias g="git"


### customs ###

alias cls="clear"
alias rr="rm -rf"
alias rb="ruby"
alias py="python"
alias js="node"
alias gitl="git log --pretty=oneline --abbrev-commit"

# OSX aliases
if [[ `uname` == 'Darwin' ]]; then
    alias subl="/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl"
fi


### aliases to external files ###

export PATH="$PATH:~/dotfiles/bin/"


### common misstypings ###

alias cd..="cd .."
alias vat="cat"
alias bim="vim"



### override ls ###

if [[ `uname` == 'Darwin' ]]; then
  alias ls="ls -G"
else
  alias ls="ls --group-directories-first --color=auto"
fi



### quit command ###

alias q="exit"
alias :q="exit"
alias :wq="exit"
alias ,q="exit"
alias ZZ="exit"



### functions ###

# Make a new directory and open it
md () {
    mkdir "$1"
    cd "$1"
}

# Git push and add message
gitp () {
  git add -A && git commit -m "$1" && git push origin master
}

# Git branch
gitb () {
  git_branch=$(git branch | grep '*' | tr '* ' '\0')
  echo $git_branch
}

# This is like ls -al, but with the octal description of the file's permission
la () {
  ls -la "$@" | awk '{k=0;for(i=0;i<=8;i++)k+=((substr($1,i+2,1)~/[rwx]/)*2^(8-i));printf("%0o ",k);print}'
}

# Restart Apache
apacherestart () {
  sudo /usr/sbin/apachectl restart
}

# compile cpp stuff
c () {
    if [[ "$1" =~ "." ]]
    then
        echo "Wrong filename"
        return;
    fi

    make $1
    ./$1
    rm $1
}


### Prompt ###
color_clear=\\[\\e[0m\\]
color_bold=\\[\\e[1m\\]

# Colors
color_black=\\[\\e[30m\\]
color_red=\\[\\e[31m\\]
color_green=\\[\\e[32m\\]
color_yellow=\\[\\e[33m\\]
color_blue=\\[\\e[34m\\]
color_magenta=\\[\\e[35m\\]
color_cyan=\\[\\e[36m\\]
color_white=\\[\\e[37m\\]



### Load the extras
source ~/dotfiles/extras/marks.sh


### Check if current dir is a valid Git repo ###

check_git_branch_for_prompt() {
  local BRANCH="";

  if [ -d .git ]; then
    gitb &> /dev/null
    BRANCH="$git_branch"
  fi

  if [ "$BRANCH" ]; then
    BRANCH="$color_green""(""$git_branch"")""$color_red"
  fi
  
  # Set the prompt
  PS1="$color_bold""$color_red""\u""$BRANCH: ""\w"" > ""$color_clear"
}

export PROMPT_COMMAND=check_git_branch_for_prompt



