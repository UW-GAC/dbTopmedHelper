#' Get trait info from a table by pht number and trait names
#' @param pht A dbGaP accession for a table, as an integer
#' @param var_names A vector of trait names
#' @param db A database connection
#' @import dbTopmed
#' @export
dbGetTraitInfoByVarName <- function(pht, var_names, db){
    pht_standardized <- .standardizeAccessions(pht)
    query <- paste("SELECT *",
                   "FROM view_source_trait",
           sprintf("WHERE dataset_accession = %s", pht_standardized),
           sprintf("AND trait_name IN ('%s');",
                   paste(var_names, collapse = "', '")))
    results <- dbGetQuery(db, query)
    return(results)
}
