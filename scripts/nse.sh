#/bin/ksh
cmd="date"
cur_month=`$cmd | cut -d " " -f 2`
cur_year=`$cmd | cut -d " " -f 6`
echo $cur_month $cur_year
for i in {1100..1125}
do
 cmd="date -j -v -$i"d
 echo $cmd 
 $cmd
 ninth=`$cmd | cut -c 9`
 if [ -z $ninth ]
 then
	 prev_date=0""`$cmd | cut -c 10` 
 else
	 prev_date=`$cmd | cut -c 9-10` 
 fi
 prev_month1=`$cmd | cut -c 5-7`
 prev_month=`echo "$prev_month1" | tr [a-z] [A-Z]`
 prev_month_num=`$cmd +"%m"` 
 prev_year=`$cmd | cut -c 25-28`

 filename=cm$prev_date""$prev_month""$prev_year""bhav.csv.zip 
 echo "File name" $filename
 ccmd="curl -o $filename --request GET https://www1.nseindia.com/content/historical/EQUITIES/$prev_year/$prev_month/$filename"
 echo $prev_month $year $prev_month_num $prev_datem
 echo $ccmd
 $ccmd
 mv -if $filename ../nse/bhavdata
 cur_month=$prev_month
 cur_year=$prev_year
done

#cd ../nse/bhavdata
#unzip *.zip && *.zip
