### UTF-8 support ###

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8



### coloring ###

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

### override ls
if [[ `uname` == 'Darwin' ]]; then
  alias ls="ls -G"
else
  alias ls="ls --group-directories-first --color=auto"
fi


### aliases to external files
export PATH="$PATH:~/dotfiles/bin"



### Prompt
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
gitb () {
  git_branch=$(git branch | grep '*' | tr '* ' '\0')
  echo $git_branch
}

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

export PROMPT_COMMAND="check_git_branch_for_prompt"



