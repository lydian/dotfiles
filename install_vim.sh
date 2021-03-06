cd ~
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp \
            --enable-python3interp \
            --enable-pythoninterp=yes \
            --with-python-config-dir=/usr/lib/python2.7/config \
            --with-python3-config-dir=/usr/lib/python3.6/config \
            --enable-perlinterp \
            --enable-luainterp \
            --without-x \
            --enable-cscope --prefix=/usr/local
make VIMRUNTIMEDIR=~/.local/usr/share/vim/vim81
make install DESTDIR=~/.local
