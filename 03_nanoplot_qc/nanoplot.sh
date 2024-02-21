# Save and run this script inside the dir that contains merged fastq files

ls *gz  > fastq_files.txt

OUTPUT="nanoplot_qc"
mkdir $OUTPUT

while read FASTQ;
do
 NanoPlot -t2 --fastq $FASTQ --loglength -o $OUTPUT/"$FASTQ"_NanoPlot_Summary
done < fastq_files.txt
