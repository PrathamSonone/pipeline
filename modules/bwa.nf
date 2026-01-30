process BWA_MEM {
    tag "$sample_id"

    input:
    tuple val(sample_id), path(reads)
    path reference

    output:
    tuple val(sample_id), path("${sample_id}.sam")

    script:
    """
    # Copy ALL index files to work directory
    cp ${params.reference} .
    cp ${params.reference}.amb .
    cp ${params.reference}.ann .
    cp ${params.reference}.bwt .
    cp ${params.reference}.pac .
    cp ${params.reference}.sa .

    bwa mem ${reference} ${reads} > ${sample_id}.sam
    """
}
