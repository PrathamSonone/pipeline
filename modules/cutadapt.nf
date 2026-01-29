process CUTADAPT {

    tag "$reads"

    input:
    path reads

    output:
    path "trimmed.fastq.gz", emit: trimmed_reads

    script:
    """
    cutadapt -a AGATCGGAAGAGC -o trimmed.fastq.gz $reads
    """
}