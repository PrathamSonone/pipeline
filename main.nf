
include { MAIN_WORKFLOW } from './workflows/main_workflow.nf'

workflow {
    MAIN_WORKFLOW()
}
