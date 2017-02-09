#! /usr/bin/env bash 

datasets="$HOME/data-sets"


states="$datasets/misc/states.tab.gz"

#1 which state in states.tab.gz has the lowest murder rate?

answer_1=$(zcat $states | grep -v '^#' | cut -f1,6 | sort -k2g | head -n1 | cut -f1)

echo "answer-1: $answer_1"

#2 How many sequence records are in the sample.fa file?

sample="$datasets/fasta/sample.fa"

answer_2=$(grep '^>' $sample | wc -l)

echo "answer-2: $answer_2"

#3 How many unique CpG IDs are in cpg.bed.gz?

cpg="$datasets/bed/cpg.bed.gz"

answer_3=$(zcat $cpg | cut -f4 | uniq -c | wc -l)

echo "answer-3: $answer_3"

#4 How many sequence records are in the SP1.fq file?

sequencerecords="$datasets/fastq/SP1.fq"

answer_4=$(cat $sequencerecords |  grep @cluster | wc -l)

echo "answer-4: $answer_4" 

#5 How many words are on lines containing the word bloody in hamlet.txt?

words="$datasets/misc/hamlet.txt"

answer_5=$(cat $words | grep bloody | wc -w)

echo "answer-5: $answer_5"

#6 What is the length of the sequence in the first record of sample.fa?

record="$datasets/fasta/sample.fa"

answer_6=$( grep -v '^>' $record | grep '^ACT' $record | wc -c)

echo "answer-6: $answer_6"


#7 what is the name of the longest gene in genes.hg19.bed.gz

genes="$datasets/bed/genes.hg19.bed.gz"

answer_7=$( zcat $genes | awk 'BEGIN{OFS="\t"} {print $0, $3 - $2}' | sort -k7nr | head -n1 | cut -f4)

echo "answer-7: $answer_7"

#8 how many unique chromosomes are in genes.hg19.bed.gz?

genes="$datasets/bed/genes.hg19.bed.gz"

answer_8=$(zcat $genes | cut -f1 | sort -k1 | uniq -c | wc -l)

echo "answer-8: $answer_8" 

#9 How many intervals are associated with CTCF 

peaks="$datasets/bed/peaks.chr22.bed.gz"

answer_9=$(zcat $peaks | grep -w  "CTCF" | wc -l)

echo "answer-9: $answer_9"


#10 On what chromosome is the largest interval in lamina.bed 

lamina="$datasets/bed/lamina.bed"

answer_10=$( awk 'BEGIN {OFS="\t"} {print $0, $3 - $2}' $lamina | sort -k5nr | head | grep chr9 | cut -f1)


echo "answer-10: $answer_10" 











