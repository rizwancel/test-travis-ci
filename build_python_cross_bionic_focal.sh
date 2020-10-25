#!/bin/sh

working_dir=${PWD}


apt-get install -y libssl-dev libreadline-dev libreadline-dev libbz2-dev libgdbm-dev libsqlite3-dev zlib1g-dev liblzma-dev libtk-img-dev libffi-dev liblzma-dev

wget https://www.python.org/ftp/python/3.8.0/Python-3.8.0.tgz

tar -xf Python-3.8.0.tgz

cd Python-3.8.0
echo "Python local = $PYTHON_LOCAL"
echo "PWD = ${PWD}"

PYTHON_LOCAL=/opt/python380-amd64
./configure --enable-optimizations --prefix=${PYTHON_LOCAL} --exec-prefix=${PYTHON_LOCAL}
make clean profile-removal
make -j`nproc`
make install
export LD_LIBRARY_PATH=${PYTHON_LOCAL}/lib:${LD_LIBRARY_PATH}
export PATH=${PYTHON_LOCAL}/bin:${PATH}
python3.8 -V
make distclean


PYTHON_LOCAL=/opt/python380-ppc

export PATH=$PATH:/opt/at14.0/bin/
./configure --host=powerpc64le-linux-gnu --build=i586-linux-gnu --enable-optimizations --disable-ipv6 --prefix=${PYTHON_LOCAL} --exec-prefix=${PYTHON_LOCAL} ac_cv_file__dev_ptc=no ac_cv_have_long_long_format=yes ac_cv_file__dev_ptmx=no
make clean profile-removal
make -j`nproc`
make install

file ${PYTHON_LOCAL}/bin/python3.8 




