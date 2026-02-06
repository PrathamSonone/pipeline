nextflow.enable.dsl = 2

include { FASTQC }          from '../modules/fastqc.nf'
include { CUTADAPT }        from '../modules/cutadapt.nf'
include { BWA_MEM }         from '../modules/bwa.nf'
include { SAMTOOLS_SORT }   from '../modules/samtools_sort.nf'
include { SAMTOOLS_INDEX }  from '../modules/samtools_index.nf'
include { BCFTOOLS_CALL } from '../modules/bcftools_call.nf'

workflow MAIN_WORKFLOW {

    
    reads_ch = Channel.fromPath(params.reads)

    
    FASTQC(reads_ch)

    
    trimmed_ch = CUTADAPT(reads_ch)

    
refdir_ch = Channel.fromPath("$baseDir/data/reference")


bwa_input_ch = trimmed_ch.map { fastq ->
    tuple('sample1', fastq)
}


sam_ch = BWA_MEM(bwa_input_ch, refdir_ch)

    
    sorted_bam = SAMTOOLS_SORT(sam_ch.map { it[1] })

    
    indexed_bam = SAMTOOLS_INDEX(sorted_bam)

    
   vcf_ch = BCFTOOLS_CALL(sorted_bam, file(params.reference))

}
