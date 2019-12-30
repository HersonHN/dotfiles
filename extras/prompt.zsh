
### Prompt Colors
color_bold="%B"
color_black="%F{black}"
color_red="%F{red}"
color_green="%F{green}"
color_yellow="%F{yellow}"
color_blue="%F{blue}"
color_magenta="%F{magenta}"
color_cyan="%F{cyan}"
color_white="%F{white}"
color_clear="%f"
bold_clear="%b"

### Check if current dir is a valid Git repo
gitb () {
  git_branch=$(git branch | grep '*' | tr '* ' '\0')
  echo $git_branch
}


check_git_prompt() {
  local BRANCH="";

  if [ -d .git ]; then
    gitb &> /dev/null
    BRANCH="$git_branch"
  fi

  if [ "$BRANCH" ]; then
    BRANCH="${color_green}(${git_branch})"
  fi
  
  # Set the prompt
  PS1="${color_bold}${color_red}%n${BRANCH}${color_red}: %~ > ${color_clear}${bold_clear}"
}

precmd() { check_git_prompt; }
