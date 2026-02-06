process BCFTOOLS_CALL {

    tag "variant_calling"

    input:
    path bam
    path reference

    output:
    path "variants.vcf"

    script:
    """
    ${params.bcftools} mpileup -f $reference $bam | \
    ${params.bcftools} call -mv -Ov -o variants.vcf
    """
}
