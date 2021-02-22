#.....................................OH MY ZSH...............................................#

# Path to oh-my-zsh installation.
export ZSH="/Users/thomasbishop/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# OMZ plugins
plugins=(git npm node osx zsh-syntax-highlighting)

#.....................................ALIASES.................................................#

# Use 'vim' for 'nvim', unless neovim is not installed
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

# Use bat in place of cat for syntax highlighting in stout
alias cat='bat'

# cd to external harddrive 
alias xhd="{cd ../../Volumes/ulysses}"

# Return Git identity
alias gitwho="{git config user.name && git config user.email}"

# Log commits in colourful graph
alias gitgraph="{git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all}"


#.....................................UI......................................................#

# Current active theme 
ZSH_THEME="spaceship"
prompt_dir() {
  #prompt_segment blue $CURRENT_FG '%~'
  prompt_segment blue $CURRENT_FG '%2~'
}

# Source syntax highlighting
source /Users/thomasbishop/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#.....................................FZF......................................................#

# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*" --glob "!/users/thomasbishop/*" --glob '

#.....................................PATH SETTINGS.............................................#

export PATH="/usr/local/opt/bin:$PATH"

# Ruby
export GEM_HOME=$HOME/gems
export PATH=$HOME/gems/bin:$PATH
export PATH="/usr/local/opt/ruby/bin:$PATH"

# PHP | Composer | MySQL
export PATH=/Applications/MAMP/Library/bin/mysql:$PATH
export PATH="$PATH:$HOME/.composer/vendor/bin"

# Python
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
