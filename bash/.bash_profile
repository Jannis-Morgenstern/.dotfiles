#!/bin/bash

[[ -f "$HOME/.bashrc" ]] && . "$HOME/.bashrc"

exec startx
. "$HOME/.cargo/env"
