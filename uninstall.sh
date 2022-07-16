#!/bin/bash

rm -f .config/nvim/plugin/packer_compiled.lua

cd ..
stow -D -t ~ nvim

rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim
