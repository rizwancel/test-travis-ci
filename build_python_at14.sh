#!/bin/sh

working_dir=${PWD}


apt-get install -y libssl-dev libreadline-dev libreadline-dev libbz2-dev libgdbm-dev libsqlite3-dev zlib1g-dev liblzma-dev libtk-img-dev libffi-dev liblzma-dev

wget https://www.python.org/ftp/python/3.6.6/Python-3.6.6.tgz

tar -xf Python-3.6.6.tgz

cd Python-3.6.6

PYTHON_LOCAL=/opt/python366-at14

echo "Python local = $PYTHON_LOCAL"

echo "PWD = ${PWD}"

./configure  --with-lto --enable-optimizations --enable-ipv6 --enable-loadable-sqlite-extensions --prefix=${PYTHON_LOCAL} --exec-prefix=${PYTHON_LOCAL}  > configure_logs 2>&1
#./configure  --with-lto --enable-ipv6 --enable-loadable-sqlite-extensions --prefix=${PYTHON_LOCAL} --exec-prefix=${PYTHON_LOCAL}

make clean profile-removal
make -j`nproc`
make install

ln -s python3 ${PYTHON_LOCAL}/bin/python

echo "print(\"Hello, World!\")" > ${working_dir}/hell_world.py

python3 ${working_dir}/hell_world.py

echo "Running hello world Program"
python3 ${working_dir}/hell_world.py

file ${PYTHON_LOCAL}/bin/python3.6

