#!/bin/bash

mkdir ~/temp-cmake
cd ~/temp-cmake
if [ ! -f ./cmake-3.6.2-Linux-x86_64.tar.gz ]; then
        wget --no-check-certificate https://cmake.org/files/v3.6/cmake-3.6.2-Linux-x86_64.tar.gz
fi
tar -zvxf cmake-3.6.2-Linux-x86_64.tar.gz
export OLD_PATH=$PATH
export PATH=~/temp-cmake/cmake-3.6.2-Linux-x86_64/bin:$PATH
echo $PATH


# Download GCC
mkdir ~/temp_gcc
cd ~/temp_gcc
if [ ! -f ./gcc-5.2.0.tar.gz ]; then
        wget http://www.netgull.com/gcc/releases/gcc-5.2.0/gcc-5.2.0.tar.gz
fi
tar xzf gcc-5.2.0.tar.gz
cd gcc-5.2.0
./contrib/download_prerequisites
cd ..
mkdir objdir
cd objdir
$PWD/../gcc-5.2.0/configure --prefix=$HOME/.local --enable-languages=c,c++,fortran,go --disable-multilib
make
make install

export LD_LIBRARY_PATH=$HOME/.local/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$HOME/.local/lib64:$LD_LIBRARY_PATH

cd ~/.vim/bundle/YouCompleteMe
CXX=$HOME/.local/bin/g++ ./install.py --clang-completer
export PATH=$OLD_PATH
