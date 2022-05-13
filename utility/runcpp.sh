#!/bin/bash
cd $PWD
g++ $1.cpp -o $1 && $PWD/$1 && echo
rm $1