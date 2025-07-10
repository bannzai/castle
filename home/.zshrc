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
alias 2="gh pr view -w"
alias 3="hub browse"
alias oss="cd $HOME/develop/oss"

# NeoVim
alias config="nvim $HOME/.config/nvim/init.vim $HOME/.zshrc"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# eval
eval "$(rbenv init -)"
eval "$(pyenv init -)"
eval "$(hub alias -s)"
eval "$(direnv hook zsh)"
PS1='${VENV_BASE:+($VENV_BASE)}'$PS1

# PATH
export MINT_PATH=$HOME/.mint
export MINT_LINK_PATH=$HOME/.mint/bin
export PATH="$MINT_LINK_PATH:$PATH"

export ANDROID_SDK=$HOME/Library/Android/sdk
export PATH=$ANDROID_SDK/emulator:$ANDROID_SDK/tools:$PATH
export PATH="$PATH":"$HOME/.pub-cache/bin"

#nvm
# export NVM_DIR="$HOME/.nvm"
# [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
# [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

#
# Functions 
#

# https://github.com/rivo/tview/issues/267#issuecomment-500226870
export LC_CTYPE="en_US.UTF-8"

fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
autoload -U compinit
compinit -u

alias soyo='echo -e "　 ∧,,∧\n （=・ω・）\n （,, ｕｕﾉ\n"'
fpath=(~/.zsh $fpath)


__git_files () { 
    _wanted files expl 'local files' _files     
}


export GITHUB_BASE_BRANCH=main
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"

# GitHub Copilot for CLI
# eval "$(github-copilot-cli alias -- "$0")"

# https://zenn.dev/omakazu/scraps/b3a4be96741a22
alias arm="exec arch -arch arm64e /bin/zsh --login"
alias x64="exec arch -arch x86_64 /bin/zsh --login"

zstyle ":completion:*:commands" rehash 1

export PATH="$HOME/ghq/github.com/flutter/flutter/bin:$PATH"
function ghq-fzf() {
  local src=$(ghq list | fzf --preview "ls -laTp $(ghq root)/{} | tail -n+4 | awk '{print \$9\"/\"\$6\"/\"\$7 \" \" \$10}'")
  if [ -n "$src" ]; then
    BUFFER="cd $(ghq root)/$src"
    zle accept-line
  fi
  zle -R -c
}
zle -N ghq-fzf
bindkey '^]' ghq-fzf

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /Users/bannzai/.dart-cli-completion/zsh-config.zsh ]] && . /Users/bannzai/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

EDITOR=nvim

export HOMEBREW_PREFIX=$(brew --prefix)

# Typo
# alias gmc=gcm

export PATH="$HOME/.local/bin:$PATH"

export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(nodenv init -)"

# formatted pythen date
alias fpdate='date "+%Y-%m-%d"'
alias fpdatetime='date "+%Y-%m-%d-%H%M%S"'
# formatted dot date
alias fddate='date "+%Y.%m.%d"'
alias fddatetime='date "+%Y.%m.%d.%H%M%S"'

alias calvar='date "+%Y%m.%d.%H%M%S"'

# 順序はglobal → nodenv init の順序を守る
export PATH="$HOME/.npm-global/bin:$PATH"
eval "$(nodenv init -)"

export REACT_EDITOR=cursor
# ref: https://x.com/_bannzai_/status/1935971028788035822
# export ENABLE_BACKGROUND_TASKS=1


alias rm=gomi

# zsh でキーコマンドを設定できるキーコマンド
register_keycommand() {
  zle -N $2
  bindkey "$1" $2
}

# worktreeを素早く変更できるzsh関数
select_worktree() {
  local worktrees
  worktrees=$(git worktree list --porcelain | awk '/worktree / {print $2}')
  if [[ -z "$worktrees" ]]; then
    echo "No worktrees found."
    return 1
  fi
  local selected
  selected=$(echo "$worktrees" | fzf)
  if [[ -n "$selected" ]]; then
    echo "$selected"
    cd "$selected"
  fi
}
# Ctrl + j で起動
register_keycommand "^l" select_worktree
