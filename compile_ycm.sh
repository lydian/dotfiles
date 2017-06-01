#!/bin/bash

mkdir ~/temp-cmake
cd ~/temp-cmake
wget --no-check-certificate https://cmake.org/files/v3.6/cmake-3.6.2-Linux-x86_64.tar.gz
tar -zvxf cmake-3.6.2-Linux-x86_64.tar.gz
export OLD_PATH=$PATH
export PATH=~/temp-cmake/cmake-3.6.2-Linux-x86_64/bin:$PATH
echo $PATH
cd ~/.vim/bundle/YouCompleteMe
CXX=/usr/bin/g++-4.8 ./install.py --clang-completer
export PATH=$OLD_PATH
