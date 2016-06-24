#!/bin/sh
FILES=PUBLIC*
for f in $FILES;
do
awk -F "," '$2 ~ /DREGION/ && $4 ~ /3/  && $7 ~!/REGIONID/ {print $0}' "$f" >>"DONE.CSV"
done

#Slice the 5 Minute Data for Market Spot Prices, Demand and other useful fileds
awk -F, 'BEGIN {OFS=","} { print $2, $5, $7,$9,$11,$14,$15,$16,$17,$18,$19,$68,$$69,$70,$71,$72}' DONE.CSV >> Final5.CSV
rm -r DONE.CSV
