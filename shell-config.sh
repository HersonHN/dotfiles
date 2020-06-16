
### These are generic shell configurations and should work for bash and zsh

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

### XDG Configuration
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

### override ls
if [[ `uname` == 'Darwin' ]]; then
  alias ls="ls -G"
else
  alias ls="ls --group-directories-first --color=auto"
fi

### helpers

# create a folder and enter it
md () {
  mkdir "$1"
  cd "$1"
}

### aliases to external files
export PATH="$PATH:$HOME/dotfiles/bin:$HOME/bin"


### ignore files configured at .gitignore for fd and fzf
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

### Load the extras
source ~/dotfiles/extras/marks.sh
source ~/dotfiles/extras/prompt.sh
