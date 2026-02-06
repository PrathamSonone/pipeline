# NGS Variant Calling Pipeline (Nextflow DSL2)

This repository contains a **modular single-end NGS variant calling pipeline**
implemented using **Nextflow DSL2**.  
The pipeline performs quality control, adapter trimming, alignment to the human
reference genome, BAM processing, and variant calling using standard
bioinformatics tools.

This repository is intended to **track pipeline logic and workflow structure
only**.  
Large input data files and reference genomes are **not tracked in GitHub** and
must be provided locally by the user.

---

## Pipeline Overview

### Input
- Single-end FASTQ file(s)
- Human reference genome (GRCh38, chromosome 22) with BWA index files

### Workflow Steps
1. Quality control of raw reads (**FastQC**)
2. Adapter trimming (**Cutadapt**)
3. Alignment to reference genome (**BWA-MEM**)
4. Sorting aligned reads (**Samtools sort**)
5. Indexing BAM files (**Samtools index**)
6. Variant calling (**BCFtools**)

---

## Clone the Repository

Clone the GitHub repository and move into the project directory:

```bash
git clone https://github.com/<your-username>/<your-repository-name>.git
cd <your-repository-name>
````

---

## Setup Environment

Create and activate the Conda environment using the provided environment.yml file:

```bash
conda env create -f environment.yml
conda activate bnf
````

---
## How to Run

This pipeline runs using **Nextflow (DSL2)** and **locally installed tools**.

### Input (not tracked in Git)

* Raw reads: `data/sample.fastq`
* Reference genome: `reference/chr38.fa`

### Run the pipeline

```bash
nextflow run main.nf
```

### Resume a stopped run

```bash
nextflow run main.nf -resume
```

---

## Tools Used

* Nextflow (DSL2)
* FastQC
* Cutadapt
* BWA
* Samtools
* BCFtools

---

## Repository Structure

```text
NGS-Pipeline2026/
│
├── main.nf
├── nextflow.config
├── environment.yml
│
├── modules/
│   ├── fastqc.nf
│   ├── cutadapt.nf
│   ├── bwa.nf
|   ├── samtools_index.nf
|   ├── samtools_sort.nf
│   └── bcftools_call.nf
│
└── workflows/
    └── workflow.nf
```