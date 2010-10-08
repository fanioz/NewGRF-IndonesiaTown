#!/bin/sh

CITIES="big x00 x01"
NUM_ALL_CITIES=0
for i in $CITIES; do
  NUM_ALL_CITIES=$((NUM_ALL_CITIES + `cat cities/$i.txt | wc -l`))
done
echo $NUM_ALL_CITIES > $1
exit 0
