process FASTQC {

    tag "$reads"

    input:
    path reads

    output:
    path "*_fastqc.html", emit: html
    path "*_fastqc.zip",  emit: zip

    script:
    """
    fastqc $reads
    """
}
