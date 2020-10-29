#!/bin/sh

working_dir=${PWD}


apt-get install -y libssl-dev libreadline-dev libreadline-dev libbz2-dev libgdbm-dev libsqlite3-dev zlib1g-dev liblzma-dev libtk-img-dev libffi-dev liblzma-dev

wget https://www.python.org/ftp/python/3.8.0/Python-3.8.0.tgz

tar -xf Python-3.8.0.tgz

cd Python-3.8.0

PYTHON_LOCAL=/opt/python380-at14

echo "Python local = $PYTHON_LOCAL"

echo "PWD = ${PWD}"

./configure CC="/opt/at14.0/bin/gcc" CXX="/opt/at14.0/bin/g++" --with-lto --enable-optimizations --enable-ipv6 --enable-loadable-sqlite-extensions --prefix=${PYTHON_LOCAL} --exec-prefix=${PYTHON_LOCAL}

make clean profile-removal
make -j`nproc`
make install

file ${PYTHON_LOCAL}/bin/python3.8
ln -s python3 ${PYTHON_LOCAL}/bin/python

export LD_LIBRARY_PATH=${PYTHON_LOCAL}/lib:${LD_LIBRARY_PATH}
export PATH=${PYTHON_LOCAL}/bin:${PATH}
python3 -VVV


echo "print(\"Hello, World!\")" > ${working_dir}/hell_world.py

echo "Running hello world Program"
python3 ${working_dir}/hell_world.py


