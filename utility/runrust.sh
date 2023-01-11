#!/bin/bash
FILE=${1::-3}
rustc $1
./$FILE
rm $FILE
