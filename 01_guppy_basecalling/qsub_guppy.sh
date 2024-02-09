#!/bin/sh

#$ -V -cwd
#$ -l h_rt=24:10:00 ###HH:MM:SS
#$ -l h_vmem=32G
#$ -q gpu
#$ -pe gpu-a100 2

# jump to the dir that contains guppy scripts, i.e. guppy's bin dir
cd /exports/eddie/scratch/pdewari/ont-guppy/bin

# INPUT_PATH has the nanopore fast5 files
INPUT_PATH=/exports/eddie/scratch/pdewari/M1/20230922_1537_X1_FAT06260_25476510/fast5

# SAVE_PATH dir will be creaed to save guppy basecall results, i.e. fastq files generated
SAVE_PATH=/exports/eddie/scratch/pdewari/BaseCalled

./guppy_basecaller --input_path $INPUT_PATH  \
--save_path $SAVE_PATH \
-x cuda:all:100% \
--compress_fastq \
--detect_mid_strand_barcodes \
--trim_barcodes \
--barcode_kits EXP-NBD196 \
--config dna_r10.3_450bps_sup.cfg
