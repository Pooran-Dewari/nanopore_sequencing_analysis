ls -d */ | xargs -n1 basename > dirs.txt

OUTPUT="merged_pass"

mkdir $OUTPUT

while read barcode;

do

 echo "merging $barcode"
 # step1: merge fastq.gz files
 cat $barcode/*.fastq.gz > $barcode/"$barcode".fastq.gz 

 # step2: validate merged file
 cd $barcode
 
 # first keep a copy of merged fastq file in $OUTPUT
 cp "$barcode".fastq.gz ../$OUTPUT

 echo "copied "$barcode".fastq.g --> $OUTPUT"

 wc -l *gz > wc.txt

 # Use awk to extract the first and last integers from the wc.txt file
 first=$(awk  -v pat="$barcode" '$2 ~ pat { print $1 }' wc.txt)
 last=$(awk '$2 ~ /total/ { print $1 }' wc.txt)

 # Check if either merged file or input files are empty!
 if (( first == 0 || last == 0 )); then
     echo "Warning: check if fastq files are empty!!"
 fi

 # Check if merged file line count is equal to sum of the rest files
 if (( last == 2*first )); then
    echo "files merged successfully"
 else
    echo "file merge error"
 fi

 cd ..
 echo "............."
 echo "            "

done < dirs.txt
