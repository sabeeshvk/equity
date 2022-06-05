#/bin/bash

cd ../nse/index/source

for filename in *.csv
do
 sed -e 's/Shares \Traded/SharesTraded/g' -e 's/Turnover (Rs. Cr)/Turnover_Rs_Cr/g'  $filename > ../csv/$filename
 ls -l $filename ../csv/$filename 
 #mv -vf $filename ./source
 exit 0
done 
