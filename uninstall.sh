#!/bin/bash

cd ..
stow -D -t ~ nvim

rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim
