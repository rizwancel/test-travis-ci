#!/bin/sh

working_dir=${PWD}

wget https://www.python.org/ftp/python/3.6.6/Python-3.6.6.tgz

tar -xf Python-3.6.6.tgz

cd Python-3.6.6

PYTHON_LOCAL=/opt/python366-at14

echo "PYTHON_LOCAL = $PYTHON_LOCAL"

echo "PWD = ${PWD}"

./configure CC="/opt/at14.0/bin/powerpc64le-linux-gnu-gcc" CXX="/opt/at14.0/bin/powerpc64le-linux-gnu-g++" --with-lto --enable-optimizations --enable-ipv6 --enable-loadable-sqlite-extensions --prefix=${PYTHON_LOCAL} --exec-prefix=${PYTHON_LOCAL}

make clean profile-removal
make -j`nproc`
make install
ln -s python3 ${PYTHON_LOCAL}/bin/python

file ${PYTHON_LOCAL}/bin/python

echo "print(\"Hello, World!\")" > ${working_dir}/hell_world.py

echo "Running python Hello world"

python3 ${working_dir}/hell_world.py


