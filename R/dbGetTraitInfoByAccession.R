#' Get trait info by dbGaP phv number
#' @param db A database connection
#' @param dbgap_trait_accessions A vector of dbGaP variable accessions, as integers
#' @export
dbGetTraitInfoByAccession <- function(db, dbgap_trait_accessions){
  accs_string <- paste("dbgap_trait_accession =",
                      dbgap_trait_accessions,
                      "OR",
                      collapse = " ")
  # Remove trailing ' OR'
  accs_string <- gsub('.{3}$', '', accs_string)

  query <- paste("SELECT dataset_accession, source_trait_id, trait_name, trait_description",
                 "FROM view_source_trait WHERE",
                 accs_string)
  dbGetQuery(db, query)
}
