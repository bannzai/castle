
#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

if [[ -d "$HOME/.zsh.d" ]]; then
  for f in $HOME/.zsh.d/*rc; do
    [ -e "$f" ] && source $f || echo "$f do not exist"
  done
fi

# homeshick
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)
source "$HOME/.homesick/repos/homeshick/homeshick.sh"

#
# zsh settings
#

# escaping git reset --hard @^ ^^^^^
setopt nonomatch

HISTSIZE=50000
SAVEHIST=100000

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Environment
EDITOR=nvim

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/hiroseyuudai/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/hiroseyuudai/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/hiroseyuudai/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/hiroseyuudai/google-cloud-sdk/completion.zsh.inc'; fi

#
# Aliases for login shell.
#

# Application
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'

# Git
alias gs='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gcm='git commit -m'
alias gp="git push"
alias gpu="gcb | xargs git push upstream"
alias gg="git grep"
alias gcb="git rev-parse --abbrev-ref HEAD" # current branch
alias gp="gcb | xargs git push origin"
alias gpf="gcb | xargs git push origin --force-with-lease"
alias git=hub

# Ruby
alias be='bundle exec'
alias bi='bundle install --path vendor/bundle'

# Go
alias go_dependencies="go list -f '{{join .Deps \"\n\"}}' |  xargs go list -f '{{if not .Standard}}{{.ImportPath}}{{end}}'"

# Utility
alias h='history 1'
alias hl='history | less'
alias f=fzf

# Settings
alias edit.mycnf="nvim /usr/local/etc/my.cnf"
alias vimrc="nvim ~/.vimrc"
alias nvimrc="nvim ~/.config/nvim/init.vim"

# ShortCuts
alias 0="cd $HOME/develop/product/"

# NeoVim
alias config="nvim $HOME/.config/nvim/init.vim $HOME/.zshrc"

# eval
eval "$(goenv init -)"
eval "$(rbenv init -)"
eval "$(hub alias -s)"
eval "$(direnv hook zsh)"

# PATH
export GOPATH=$HOME/go

export PATH="$HOME/usr/local/bin:$PATH"
export PATH="$HOME/usr/bin:$PATH"
export PATH=$GOPATH/bin:$PATH
export PATH="$HOME/.local/bin/:$PATH"

#
# Functions 
#

code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}
