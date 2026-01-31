process SAMTOOLS_SORT {

    input:
    path sam

    output:
    path "sorted.bam"

    script:
    """
    ${params.samtools} sort -o sorted.bam $sam
    """
}
