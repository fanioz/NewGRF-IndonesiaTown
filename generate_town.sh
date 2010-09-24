#!/bin/sh

#based on make.sh by Ammler

NML=$1
CITIES="big x00 x01"
#number of city file + 1
let N_CITIES=4;

cat sprites/header.pnml > $NML

for i in $CITIES; do
cat >>$NML <<EOF
town_names($i) {
  {
`awk -F'\t' '{print "    text(\""$2"\", "$1"),"}' cities/$i.txt`
EOF
cat sprites/closebracket.pnml >> $NML
done

cat sprites/mother.pnml >> $NML

let NUM_ALL_CITIES=0
for i in $CITIES; do
  let --N_CITIES
  echo "    town_names($i, $N_CITIES)," >>$NML
  let NUM_CUR_CITY=`cat cities/$i.txt | wc -l`
  echo number of generated towns from $i.txt was $NUM_CUR_CITY
  let NUM_ALL_CITIES+=NUM_CUR_CITY
done

cat sprites/closebracket.pnml >> $NML
echo Total town generated: $NUM_ALL_CITIES
echo NUMTOWNS: $NUM_ALL_CITIES >  number.txt
exit 0
