#!/bin/env bash
cd build/lib*/healpy/test/data
. get_wmap_maps.sh
cd ../..
for lib in *.so
do
    echo "++++++++++++++++++++++++++++++++++++"
    echo $lib
    ldd $lib
    echo "++++++++++++++++++++++++++++++++++++"
done
nosetests -v --with-doctest
nosetests_returnvalue=$?
echo Run Cython extensions doctests
python run_doctest_cython.py
cython_doctest_returnvalue=$?
exit $(($nosetests_returnvalue + $cython_doctest_returnvalue))
