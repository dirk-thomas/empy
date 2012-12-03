#!/bin/sh
#
# $Id: //projects/empy/test.sh#6 $ $Date: 2003/03/22 $

if [ $# = 1 ]
then
    PYTHON="$1"
else
    PYTHON=python
fi

EMPY=em.py
SAMPLE=sample.em
BENCH=sample.bench

if $PYTHON -c 'import sys; print sys.version' > /dev/null
then
    :
else
    echo "EmPy was not checked; $PYTHON looks broken." 1>&2
    exit 1
fi

if $PYTHON $EMPY $SAMPLE | diff $BENCH -
then
    echo "EmPy checks out." 1>&2
else
    echo "EmPy does not check out!  Please mail output to author." 1>&2
fi
