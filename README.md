# Automated Bioinformatics Pipeline using Nextflow

## Description
This repository contains an automated bioinformatics pipeline developed using Nextflow DSL2.
The pipeline performs preprocessing and alignment of sequencing data.

## Pipeline Steps
1. Quality Control using FastQC
2. Adapter trimming using Cutadapt
3. Alignment to human reference genome (GRCh38 chromosome 22) using BWA

## Tools Used
- Nextflow
- FastQC
- Cutadapt
- BWA
- Samtools
- Conda

## How to Run
```bash
conda activate bnf
nextflow run main.nf

