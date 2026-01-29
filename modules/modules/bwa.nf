process BWA_MEM {

    tag "$sample_id"

    input:
    tuple val(sample_id), path(reads)
    path reference

    output:
    tuple val(sample_id), path("${sample_id}.sam")

    script:
    """
    bwa mem ${reference} ${reads} > ${sample_id}.sam
    """
}
