#!/bin/sh

#based on make.sh by Ammler

NML=$1
CITIES="big x00 x01"
#number of city file + 1
N_CITIES=4;

for i in $CITIES; do
cat >>$NML <<EOF
town_names($i) {
  {
`awk -F'\t' '{
    if (($1 * 1) < 1) next
    print "    text(\""$2"\", "$1"),"
    gent++};
    END {print "/*generated\t"gent"\t*/"}' cities/$i.txt`
EOF
cat sprites/closebracket.pnml >> $NML
done

cat sprites/mother.pnml >> $NML

for i in $CITIES; do
  echo "    town_names($i, $((N_CITIES = N_CITIES - 1)))," >>$NML
done

cat sprites/closebracket.pnml >> $NML
exit 0
