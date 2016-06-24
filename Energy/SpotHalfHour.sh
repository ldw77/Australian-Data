#!/bin/sh
FILES=PUBLIC*
for f in $FILES;
do
awk -F "," '$2 ~ /TREGION/ && $4 ~ /2/  && $7 ~!/REGIONID/ {print $0}' "$f" >>"DONE.CSV"
done

#Slice the Half Hourly Data for Market Spot Prices, Demand and other useful fileds
awk -F, 'BEGIN {OFS=","} { print $2, $5, $6, $7, $8, $9,$10,$11,$12,$13,$14,$15,$16}' DONE.CSV >> Final.CSV
rm -r DONE.CSV

