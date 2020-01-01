dotfiles
========

HersonHN's dotfiles.

### Installation

```
cd ~
git clone https://github.com/HersonHN/dotfiles.git --recursive
cd dotfiles
. install.sh
```

### Configure colors

You can configure the prompt colors using the global variables `PROMPT_COLOR` and `PROMPT_COLOR_BRANCH`.

You can set any of these values for the variables:

- `black`
- `red`
- `green`
- `yellow`
- `blue`
- `magenta`
- `cyan`
- `white`

For example, on your .zshrc file:

```zsh
export PROMPT_COLOR="blue"
export PROMPT_COLOR_BRANCH="cyan"
source ~/dotfiles/zshrc.zsh
```
