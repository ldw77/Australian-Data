#!/bin/sh
####### Process Public Daily Files For Generation 
FILES=*
for f in $FILES;
do
awk -F "," '$2 ~ /TUNIT/ && $4 ~ /2/  && $7 ~!/DUID/ {print $0}' "$f" >>"Dispatch_temp.CSV"
done

###### Cut and paste dispatch data into a temp file called DONE.CSV
awk 'BEGIN { FS=","; OFS="," } {$1=$3=$4=$6=$10=$11=$12=$13=$14=$15=$16=$17="";gsub(",+",",",$0)}1 {print $0}' "Dispatch_temp.CSV" >>"DONE.CSV"

# The first column in the above file will be blank so we can remove it via the following
awk -F, '{for(i=1;i<=NF;i++)if(i!=x)f=f?f FS $i:$i;print f;f=""}' x=1 DONE.CSV >> FINAL.CSV
