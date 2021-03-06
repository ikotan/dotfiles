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
if [ -f "${HOME}/.enhancd/zsh/enhancd.zsh" ]; then
    source "${HOME}/.enhancd/zsh/enhancd.zsh"
fi

# appdriver env
if [ -f "${HOME}/.env.appdriver" ]; then
    source "${HOME}/.env.appdriver"
fi

# env function
if [ -f "${HOME}/.env.function" ]; then
    source "${HOME}/.env.function"
fi

# default bin
export PATH=/sbin:/usr/sbin:$PATH

# default editor
export EDITOR=vim
export VISUAL=vim
export PAGER=less

# rbenv
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

# plenv
export PATH=$HOME/.plenv/bin:$PATH
eval "$(plenv init -)"

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# cassandra
export PATH=$PATH:/usr/local/cassandra/bin

# Customize to your needs...

export HISTSIZE=100000
export HISTFILESIZE=100000
export LANG=ja_JP.UTF-8

export LOCAL_IP='192.168.30.10'

# radvent calendar secret_key
export SECRET_KEY_BASE=c39516b8fbcdcc9bec8f99cedc2d5a04b4da03ce3786a60521e0f7df465af5112012c00980cf06ea235af2cd101d09643de21d8672cd0050d8e92f5c7c86e6af

alias vi='vim'
alias st='ssh-agent tmux -2'
alias sta='ssh-agent tmux -2 a'
alias ssh='ssh -t'
alias innotop='perl /tmp/innotop/innotop'
alias tsc='tsc --noImplicitAny'
