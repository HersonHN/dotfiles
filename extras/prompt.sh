
if [ -n "$ZSH_VERSION" ]; then
  prompt_version="zsh"
else
  prompt_version="bash"
fi

if [ ! -n "$PROMPT_COLOR" ]; then
  PROMPT_COLOR="red";
fi
if [ ! -n "$PROMPT_COLOR_BRANCH" ]; then
  PROMPT_COLOR_BRANCH="green";
fi

function get_color_code() {
  if [ "$prompt_version" = "zsh" ]; then
    case $1 in
      clear_color) echo "%f"     ;;
      clear_bold)  echo "%b"     ;;
      bold_text)   echo "%B"     ;;
      *)           echo "%F{$1}" ;;
    esac
  else
    case $1 in
      black)       echo "\\[\\e[30m\\]" ;;
      red)         echo "\\[\\e[31m\\]" ;;
      green)       echo "\\[\\e[32m\\]" ;;
      yellow)      echo "\\[\\e[33m\\]" ;;
      blue)        echo "\\[\\e[34m\\]" ;;
      magenta)     echo "\\[\\e[35m\\]" ;;
      cyan)        echo "\\[\\e[36m\\]" ;;
      white)       echo "\\[\\e[37m\\]" ;;
      clear_color) echo "\\[\\e[0m\\]"  ;;
      bold_text)   echo "\\[\\e[1m\\]"  ;;
      clear_bold)  echo ""              ;;
    esac
  fi
}

### Check if current dir is a valid Git repo
function gitb () {
  git_branch=$(git branch | grep '*' | tr '* ' '\0')
  echo $git_branch
}

function check_git_prompt() {
  local branch="";

  if [ "$prompt_version" = "zsh" ]; then
    local user="%n"
    local dir="%~"
  else
    local user="\u"
    local dir="\w"
  fi

  local bold_text=$(get_color_code bold_text)
  local clear_bold=$(get_color_code clear_bold)
  local clear_color=$(get_color_code clear_color)
  
  # Set the prompt colors
  local prompt_color=$(get_color_code $PROMPT_COLOR)
  local branch_color=$(get_color_code $PROMPT_COLOR_BRANCH)


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
