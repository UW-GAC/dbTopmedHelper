#' Returns a list of complete tables by pht accession
#' @param phts A vector of pht accessions
#' @param db A connection to topmed_pheno
#' @import dbTopmed
#' @export
dbGetTableByAccession <- function(phts, db){
  phts_standardized <- .standardizeAccessions(phts)
  qry_get_trait_ids <- paste("select source_trait_id from view_source_trait",
                              sprintf("where dataset_accession in (%s);",
                                      paste(phts_standardized, collapse = ", ")))
  source_trait_ids <- dbGetQuery(db, qry_get_trait_ids)
  phen_list <- dbGetComponentTraitData(db, unlist(source_trait_ids))
  return(phen_list)
}
