
### Prompt Colors
color_bold=\\[\\e[1m\\]
color_black=\\[\\e[30m\\]
color_red=\\[\\e[31m\\]
color_green=\\[\\e[32m\\]
color_yellow=\\[\\e[33m\\]
color_blue=\\[\\e[34m\\]
color_magenta=\\[\\e[35m\\]
color_cyan=\\[\\e[36m\\]
color_white=\\[\\e[37m\\]
color_clear=\\[\\e[0m\\]


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
  PS1="${color_bold}${color_red}\u${BRANCH}${color_red}: \w > ${color_clear}"
}



PROMPT_COMMAND="check_git_prompt"

