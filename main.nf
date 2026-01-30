params.reads = 'data/sample.fastq.gz'

include { FASTQC as FASTQC_RAW  } from './modules/fastqc.nf'
include { CUTADAPT             } from './modules/cutadapt.nf'  
include { FASTQC as FASTQC_TRIM } from './modules/fastqc.nf'

workflow {
    reads_ch = Channel.fromPath(params.reads)
    
    // 1. FASTQC on RAW reads
    FASTQC_RAW(reads_ch)
    
    // 2. CUTADAPT trimming
    trimmed_ch = CUTADAPT(reads_ch)
    
    // 3. FASTQC on TRIMMED reads  
    FASTQC_TRIM(trimmed_ch)
}