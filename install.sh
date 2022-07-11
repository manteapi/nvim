#!/bin/bash

rm -rf ~/.local/share/nvim
cd ..
stow -t ~ nvim 
