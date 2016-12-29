#' Get trait info by dbGaP phv number
#' @param db A database connection
#' @param dbgap_trait_accession The dbGaP variable accession, as an integer
dbGetTraitInfoByAccession <- function(db, dbgap_trait_accession){
  query <- paste("SELECT dataset_accession, source_trait_id, trait_name, trait_description",
                 "FROM view_source_trait",
                 sprintf("WHERE dbgap_trait_accession = %s", dbgap_trait_accession))
  dbGetQuery(db, query)
}
