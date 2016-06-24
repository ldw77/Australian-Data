#!/bin/sh
####### Process Public Daily Files For Generation 
FILES=*
for f in $FILES;
do
awk -F "," '$2 ~ /TUNIT/ && $4 ~ /2/  && $7 ~!/DUID/ {print $0}' "$f" >>"Dispatch_temp.CSV"
done

###### Cut and paste dispatch data into a temp file called DONE.CSV
awk 'BEGIN { FS=","; OFS="," } {$1=$3=$4=$6=$10=$11=$12=$13=$14=$15=$16=$17="";gsub(",+",",",$0)}1 {print $0}' "Dispatch_temp.CSV" >>"DONE.CSV"
