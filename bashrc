#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias diff='diff --color=auto'
alias rm='rm -I'
PS1='[\e[0;32m\e[0;34m\u@\h \e[0;36m\A \e[0;32m\W\e[0m]\$ '

# Unlimited stack size
# For programming, especially Competitive Programming
ulimit -s unlimited

# Default setting
# PS1='[\u@\h \W]\$ '

export PATH="~/.local/bin:$PATH"
