#!/bin/bash

# set some useful settings to handle errors
set -euo pipefail

# define url's and file paths
FASTQ_R1="subset-SRR11518889_1.fastq.gz"
FASTQ_R2="subset-SRR11518889_2.fastq.gz"
FASTQ_URL="https://raw.githubusercontent.com/AlexsLemonade/reproducible-research/main/instructor_notes/fastq_subset"

DATA_DIR="../data/raw/fastq/SRP255885"
mkdir -p ${DATA_DIR}

############## process the R1 file ##############

echo "Downloading the R1 file"

# download the file
curl -O ${FASTQ_URL}/${FASTQ_R1}

# move the file
mv ${FASTQ_R1} ${DATA_DIR}/

# print the number of lines in the file

echo "The R1 file has this many lines:"
gunzip -c ${DATA_DIR}/${FASTQ_R1} | wc -l

############## process the R2 file ##############

echo "Downloading the R2 file"
# download the file
curl -O ${FASTQ_URL}/${FASTQ_R2}

# move the file
mv ${FASTQ_R2} ${DATA_DIR}/

echo "The R2 file has this many lines:"
# print the number of lines in the file
gunzip -c ${DATA_DIR}/${FASTQ_R2} | wc -l