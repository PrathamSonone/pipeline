include { CUTADAPT }       from '../modules/cutadapt.nf'
include { FASTQC }         from '../modules/fastqc.nf'
include { BWA_ALIGN }      from '../modules/bwa.nf'
include { SAMTOOLS_SORT }  from '../modules/samtools_sort.nf'
include { SAMTOOLS_INDEX } from '../modules/samtools_index.nf'
include { FLAGSTAT }       from '../modules/flagstat.nf'

workflow MAIN_WORKFLOW {

    Channel.fromPath("data/*.fastq") \
        | CUTADAPT \
        | FASTQC \
        | BWA_ALIGN \
        | SAMTOOLS_SORT \
        | SAMTOOLS_INDEX \
        | FLAGSTAT
}
