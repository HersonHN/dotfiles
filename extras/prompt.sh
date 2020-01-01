
### check version, this could be:
#   zsh for zsh
#   bash4 for bash v4 and above
#   bash3 for bash v3 and practically everything else
if [ -n "$ZSH_VERSION" ]; then
  prompt_version="zsh"
elif [ "${BASH_VERSINFO:-0}" -ge 4 ]; then
  prompt_version="bash4"
else
  prompt_version="bash3"
fi

### Check if current dir is a valid Git repo
gitb () {
  git_branch=$(git branch | grep '*' | tr '* ' '\0')
  echo $git_branch
}


check_git_prompt() {
  local branch="";

  if [ "$prompt_version" = "zsh" ]; then
    local user="%n"
    local dir="%~"
    local clear_color="%f"
    local clear_bold="%b"
    local bold_text="%B"
  else
    local user="\u"
    local dir="\w"
    local clear_color="\\[\\e[0m\\]"
    local clear_bold=""
    local bold_text="\\[\\e[1m\\]"
  fi

  if [ "$prompt_version" = "zsh" ]; then
    ## typset for zsh
    typeset -A color
    color[black]="%F{black}"
    color[red]="%F{red}"
    color[green]="%F{green}"
    color[yellow]="%F{yellow}"
    color[blue]="%F{blue}"
    color[magenta]="%F{magenta}"
    color[cyan]="%F{cyan}"
    color[white]="%F{white}"

  elif [ "$prompt_version" = "bash4" ]; then
    ## declare for bash
    declare -A color
    color[black]="\\[\\e[30m\\]"
    color[red]="\\[\\e[31m\\]"
    color[green]="\\[\\e[32m\\]"
    color[yellow]="\\[\\e[33m\\]"
    color[blue]="\\[\\e[34m\\]"
    color[magenta]="\\[\\e[35m\\]"
    color[cyan]="\\[\\e[36m\\]"
    color[white]="\\[\\e[37m\\]"

  else
    ## bash 3 does not support hashmaps 
    local color_red="\\[\\e[31m\\]"
    local color_green="\\[\\e[32m\\]"
  fi

  # Set the prompt colors
  if [ "$prompt_version" = "bash3" ]; then
    local prompt_color="${color_red}"
    local branch_color="${color_green}"
  else
    
    if [ ! -n "$PROMPT_COLOR" ]; then
      local PROMPT_COLOR="red";
    fi

    if [ ! -n "$PROMPT_COLOR_BRANCH" ]; then
      local PROMPT_COLOR_BRANCH="red";
    fi
    local prompt_color="${color[$PROMPT_COLOR]}"
    local branch_color="${color[$PROMPT_COLOR_BRANCH]}"
  fi

  if [ -d .git ]; then
    gitb &> /dev/null
    branch="$git_branch"
  fi

  if [ "$branch" ]; then
    branch="${branch_color}(${git_branch})${prompt_color}"
  fi

  PS1="${bold_text}${prompt_color}${user}${branch}: ${dir} > ${clear_color}${clear_bold}"
}


if [ "$prompt_version" = "zsh" ]; then
  precmd() { check_git_prompt; }
else
  PROMPT_COMMAND="check_git_prompt"
fi
