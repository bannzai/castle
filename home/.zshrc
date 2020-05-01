source ~/.zshrc.local
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
alias 1="cd $HOME/ghq/github.com"
alias 2="hub pr show"
alias oss="cd $HOME/develop/oss"

# NeoVim
alias config="nvim $HOME/.config/nvim/init.vim $HOME/.zshrc"

## LLVM
alias llvm=llvm@7
export PATH="$PATH:`brew --prefix llvm@7`/bin"


# eval
eval "$(rbenv init -)"
eval "$(hub alias -s)"
eval "$(direnv hook zsh)"
eval "$(nodenv init -)"

# PATH
export GOPATH=$HOME/go
export MINT_PATH=$HOME/.mint
export MINT_LINK_PATH=$HOME/.mint/bin

export PATH="$HOME/usr/local/bin:$PATH"
export PATH="$HOME/usr/bin:$PATH"
export PATH=$GOPATH/bin:$PATH
export PATH="$HOME/.local/bin/:$PATH"
export PATH="$MINT_LINK_PATH:$PATH"


#
# Functions 
#

code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

# https://github.com/rivo/tview/issues/267#issuecomment-500226870
export LC_CTYPE="en_US.UTF-8"

fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
autoload -U compinit
compinit -u
