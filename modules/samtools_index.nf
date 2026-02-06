process SAMTOOLS_INDEX {

    tag "samtools_index"

    input:
    path bam

    output:
    path "*.bai"

    script:
    """
    ${params.samtools} index $bam
    """
}


