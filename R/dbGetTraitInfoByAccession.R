#' Get trait info by dbGaP phv number
#' @param db A database connection
#' @param dbgap_trait_accessions A vector of dbGaP variable accessions, as integers or strings with a leading "phv"
#' @import dbTopmed
#' @import magrittr
#' @export

dbGetTraitInfoByAccession <- function(db, dbgap_trait_accessions){
    accs_standardized <- .standardizeAccessions(dbgap_trait_accessions)
    query <- paste("SELECT *",
                   "FROM view_source_trait WHERE",
                   sprintf("dbgap_trait_accession IN (%s)",
                           paste(accs_standardized, collapse = ", ")))
    dbGetQuery(db, query)
}
