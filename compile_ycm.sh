#!/bin/bash

cd ~/.vim/bundle/YouCompleteMe
CXX=$HOME/.local/bin/g++ ./install.py --clang-completer
export PATH=$OLD_PATH
