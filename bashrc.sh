### UTF-8 support ###

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8



### coloring ###

export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad



### customs ###

alias cls="clear"
alias sasw="sass --watch ."
alias sassw="sasw"
alias v="vim"
alias rr="rm -rf"
alias gitl="git log --pretty=oneline --abbrev-commit"
alias rb="ruby"



### aliases to external files ###

alias tree="sh ~/dotfiles/bin/lstree.sh"
alias fixchmod="sh ~/dotfiles/bin/fix-chmod.sh"



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
    mkdir $1
    cd $1
}

# Extract tar, zip, etc in with a single command
# Found here: <http://alias.sh/extract-most-know-archives-one-command>
extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1     ;;
      *.tar.gz)    tar xzf $1     ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar e $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xf $1      ;;
      *.tbz2)      tar xjf $1     ;;
      *.tgz)       tar xzf $1     ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Git push and add message
gitp () {
  git add -A && git commit -m "$1" && git push origin master
}

# This is like ls -al, but with the octal description of the file's permission
la () {
  ls -la "$@" | awk '{k=0;for(i=0;i<=8;i++)k+=((substr($1,i+2,1)~/[rwx]/)*2^(8-i));printf("%0o ",k);print}'
}

# Restart Apache
apacherestart () {
  sudo /usr/sbin/apachectl restart
}

# Simple server
server () {
  python -m SimpleHTTPServer $1 &
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



### Check if current dir is a valid Git repo ###

checkGitForPrompt() {
  if [ -d .git ] || git rev-parse --git-dir > /dev/null 2>&1;
  then
    git_branch="$(git branch)"
    git_branch=${git_branch/\* /}
    git_branch="$color_green($git_branch)$color_red"
  else
    git_branch=""
  fi
  
  # Set the prompt
  PS1="ツ $color_bold$color_red\u$git_branch: \w > $color_clear"
}

export PROMPT_COMMAND=checkGitForPrompt





