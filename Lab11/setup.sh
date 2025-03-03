#!/bin/bash

git clone https://github.com/htop-dev/htop.git
cd htop || exit

./autogen.sh && ./configure && make && sudo make install

cd ..
rm -rf htop

echo "Installation complete!"
