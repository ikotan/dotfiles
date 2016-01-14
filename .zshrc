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

# enhancd
if [ -f "/home/vagrant/.enhancd/zsh/enhancd.zsh" ]; then
    source "/home/vagrant/.enhancd/zsh/enhancd.zsh"
fi

# default bin
export PATH=/sbin:$PATH

# rbenv
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

# rbenv
export PATH=$HOME/.plenv/bin:$PATH
eval "$(plenv init -)"

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# radevent
export SECRET_KEY_BASE=c34e5444cb4d3756a55c10a9b3fa905803f3be6a4f54bd6f62b3ddbc4913be0f3fb083ac7f7b9a9299a5b76391da3dea779a8194006671422caa203889c3d81a

# Customize to your needs...

export HISTSIZE=100000
export HISTFILESIZE=100000
export LANG=ja_JP.UTF-8

bindkey '^p' history-beginning-search-backward
bindkey '^n' history-beginning-search-forward

function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi

    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^R' peco-select-history

function peco-select-host () {
    CMD=$(grep -iE '^host\s+(\w|\d)+' ~/.ssh/config | awk '{print $2}' | peco --query "$LBUFFER")
    if [ -n "$CMD" ]; then
        BUFFER="ssh $CMD"
        CURSOR=$#BUFFER
    fi
    zle clear-screen
}
zle -N peco-select-host
bindkey '^O' peco-select-host

# svn diff
function svn_diff_stop_on_copy {
  local revision_by_stop_on_copy=`svn log --stop-on-copy -q --incremental | tail -1 | sed 's/^r\([0-9]\+\).*$/\1/' | tr -d '\n'`
  svn diff -r $revision_by_stop_on_copy:HEAD
}

alias vi='vim'
alias st='ssh-agent tmux -2'
alias sta='ssh-agent tmux -2 a'
