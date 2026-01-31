process FLAGSTAT {

    input:
    path bam

    output:
    path "flagstat.txt"

    script:
    """
    ${params.samtools} flagstat $bam > flagstat.txt
    """
}
