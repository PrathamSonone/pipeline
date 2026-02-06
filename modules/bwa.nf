process BWA_MEM {

    tag "$sample_id"

    input:
    tuple val(sample_id), path(reads)
    path refdir

    output:
    tuple val(sample_id), path("${sample_id}.sam")

    script:
    """
    ${params.bwa} mem ${refdir}/Homo_sapiens.GRCh38.dna.chromosome.22.fa ${reads} > ${sample_id}.sam
    """
}

