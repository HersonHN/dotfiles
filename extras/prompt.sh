
### Prompt Colors
if [ -n "$ZSH_VERSION" ]; then
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
  
  user="%n"
  dir="%~"

else # asuming is bash // "$BASH_VERSION"
  color_bold="\\[\\e[1m\\]"
  color_black="\\[\\e[30m\\]"
  color_red="\\[\\e[31m\\]"
  color_green="\\[\\e[32m\\]"
  color_yellow="\\[\\e[33m\\]"
  color_blue="\\[\\e[34m\\]"
  color_magenta="\\[\\e[35m\\]"
  color_cyan="\\[\\e[36m\\]"
  color_white="\\[\\e[37m\\]"
  color_clear="\\[\\e[0m\\]"
  bold_clear=""

  user="\u"
  dir="\w"
fi

### Check if current dir is a valid Git repo
gitb () {
  git_branch=$(git branch | grep '*' | tr '* ' '\0')
  echo $git_branch
}


check_git_prompt() {
  local branch="";

  if [ -d .git ]; then
    gitb &> /dev/null
    branch="$git_branch"
  fi

  if [ "$branch" ]; then
    branch="${color_green}(${git_branch})"
  fi
  
  # Set the prompt
  PS1="${color_bold}${color_red}${user}${branch}${color_red}: ${dir} > ${color_clear}${bold_clear}"
}


if [ -n "$ZSH_VERSION" ]; then
  precmd() { check_git_prompt; }
else # asuming is bash // "$BASH_VERSION"
  PROMPT_COMMAND="check_git_prompt"
fi
