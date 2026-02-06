nextflow.enable.dsl = 2

include { FASTQC }          from '../modules/fastqc.nf'
include { CUTADAPT }        from '../modules/cutadapt.nf'
include { BWA_MEM }         from '../modules/bwa.nf'
include { SAMTOOLS_SORT }   from '../modules/samtools_sort.nf'
include { SAMTOOLS_INDEX }  from '../modules/samtools_index.nf'
include { BCFTOOLS_CALL } from '../modules/bcftools_call.nf'

workflow MAIN_WORKFLOW {

    // Input channel from config
    reads_ch = Channel.fromPath(params.reads)

    // Step 1: QC
    FASTQC(reads_ch)

    // Step 2: Trimming
    trimmed_ch = CUTADAPT(reads_ch)

    // Reference directory (contains .fa + all BWA index files)
refdir_ch = Channel.fromPath("$baseDir/data/reference")

// Prepare input for BWA
bwa_input_ch = trimmed_ch.map { fastq ->
    tuple('sample1', fastq)
}

// Call BWA (ONLY TWO ARGUMENTS)
sam_ch = BWA_MEM(bwa_input_ch, refdir_ch)

    // Step 5: Sort BAM
    sorted_bam = SAMTOOLS_SORT(sam_ch.map { it[1] })

    // Step 6: Index BAM
    indexed_bam = SAMTOOLS_INDEX(sorted_bam)

    // Step 7: Variant calling
   vcf_ch = BCFTOOLS_CALL(sorted_bam, file(params.reference))

}
