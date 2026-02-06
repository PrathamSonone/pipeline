process SAMTOOLS_SORT {

    tag "samtools_sort"

    input:
    path sam

    output:
    path "sorted.bam"

    script:
    """
    ${params.samtools} sort -o sorted.bam $sam
    """
}

