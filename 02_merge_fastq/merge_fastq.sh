for barcode in */

do

 echo "merging $barcode"
 # step1: merge fastq.gz files
 subdir=$(basename "$barcode")
 cat $subdir/*.fastq.gz > $subdir/"$subdir".fastq.gz

 # step2: validate merged file
 cd $subdir
 wc -l *gz > wc.txt

 # Use awk to extract the first and last integers from the wc.txt file
 first=$(awk  -v pat="$subdir" '$2 ~ pat { print $1 }' wc.txt)
 last=$(awk '$2 ~ /total/ { print $1 }' wc.txt)
 echo $first
 echo $last

 # Check if either merged file or input files are empty!
 if (( first == 0 || last == 0 )); then
     echo "Warning: either merged or input fastq files are empty!!"
 fi

 # Check if merged file line count is equal to sum of the rest files
 if (( last == 2*first )); then
    echo "files merged successfully"
 else
    echo "file merge error"
 fi
 #rm wc.txt
 cd ..
 echo "............."
 echo "            "

done
