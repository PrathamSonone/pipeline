process SAMTOOLS_INDEX {

    input:
    path bam

    output:
    path "sorted.bam.bai"

    script:
    """
    ${params.samtools} index $bam
    """
}

