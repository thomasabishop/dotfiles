export ZSH="/home/thomas/.oh-my-zsh"

alias vim="nvim"
alias cat="bat"

ZSH_THEME=spaceship

SPACESHIP_PACKAGE_SHOW=true
SPACESHIP_TIME_SHOW=true
SPACESHIP_NODE_SHOW=true
SPACESHIP_PACKAGE_SYMBOL=""
SPACESHIP_PACKAGE_COLOR="#e08009"
SPACESHIP_GIT_BRANCH_COLOR="#00aae0"
SPACESHIP_DIR_COLOR="#18e000"
SPACESHIP_TIME_COLOR="#bde000"
SPACESHIP_EXEC_TIME_SHOW=true

plugins=(git npm zsh-syntax-highlighting)

# User configuration

# Prompt on new line
prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n " %{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi
  echo -n "\n%{%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{%f%}"
  CURRENT_BG=''
}

BROWSER=/usr/bin/google-chrome-stable

source $ZSH/oh-my-zsh.sh
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
