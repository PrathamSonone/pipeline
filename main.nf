 nextflow.enable.dsl = 2

/*
 * --------------------
 * PARAMETERS (TOP)
 * --------------------
 */
params.reads     = 'data/sample.fastq.gz'
params.reference = 'data/reference/Homo_sapiens.GRCh38.dna.chromosome.22.fa'

/*
 * --------------------
 * MODULE IMPORTS
 * --------------------
 */
include { FASTQC }   from './modules/fastqc.nf'
include { CUTADAPT } from './modules/cutadapt.nf'
include { BWA_MEM }  from './modules/bwa.nf'

/*
 * --------------------
 * WORKFLOW
 * --------------------
 */
workflow {

    // Create channel from FASTQ
    reads_ch = Channel.fromPath(params.reads)

    // FastQC
    FASTQC(reads_ch)

    // Cutadapt
    trimmed_ch = CUTADAPT(reads_ch)

    // Add sample ID for BWA (THIS IS THE FIX)
    bwa_input_ch = trimmed_ch.map { fastq ->
        tuple('sample1', fastq)
    }

    // BWA MEM alignment
    BWA_MEM(bwa_input_ch, file(params.reference))
}
