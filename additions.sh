#!/bin/bash
today=`date +%Y-%m-%d -d "yesterday"`
sum=$(find /home/soviel/mounting/dpcp -mtime -1 -printf "%s\n"|awk '{t+=$1}END{print t}')
readablesum=$(numfmt --to=iec $sum)
echo "$today $sum $readablesum" >> /home/soviel/additions.txt
