#! /usr/bin/env bash 

datasets="$HOME/data-sets"


states="$datasets/misc/states.tab.gz"

# which state in states.tab.gz has the lowest murder rate?

answer_1=$(zcat $states | grep -v '^#' | cut -f1,6 | sort -k2g | head -n1 | cut -f1)

echo "answer-1: $answer_1"

# How many sequence records are in the sample.fa file?

sample="$datasets/fasta/sample.fa"

answer_2=$(grep '^>' $sample | wc -l)

echo "answer-2: $answer_2"

#How many unique CpG IDs are in cpg.bed.gz?

cpg="$datasets/bed/cpg.bed.gz"

answer_3=$(zcat $cpg | cut -f4 | uniq -c | wc -l)

echo "answer-3: $answer_3"

# How many sequence records are in the SP1.fq file?

sequencerecords="$datasets/fastq/SP1.fq"

answer_4=$(cat $sequencerecords |  grep @cluster | wc -l)

echo "answer-4: $answer_4" 








