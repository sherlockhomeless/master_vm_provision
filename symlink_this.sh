#!/usr/bin/bash

echo "parameter is path to create symlinks to"

CWD=$(pwd)/
for f in $(ls)
do
    ln -s $CWD$f $1/$f
    echo "linking $CWD$f with $1/$f"
done

