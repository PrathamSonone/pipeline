#!/bin/bash -ue
cutadapt -a AGATCGGAAGAGC -o trimmed.fastq.gz sample.fastq.gz
