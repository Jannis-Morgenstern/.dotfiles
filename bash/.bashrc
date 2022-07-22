#!/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias lsl='ls -l'
alias lsa='ls -la'
alias x='startx'
alias il='ip link'

PS1='[\u@\h \W]\$ '

export PATH="$HOME/scripts/bspwm:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

export PNPM_HOME="/home/jannis/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

# fnm
export PATH=/home/jannis/.fnm:$PATH
eval "`fnm env`"
