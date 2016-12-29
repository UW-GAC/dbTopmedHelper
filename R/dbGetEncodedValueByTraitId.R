#' Get encoded values by trait ID
#' @param db A database connection
#' @param trait_ids a vector of trait_ids
dbGetEncodedValueByTraitId <- function(db, trait_ids){
  ids_string <- paste("e.source_trait_id =", trait_ids, "OR", collapse = " ")
  # Remove trailing ' OR'
  ids_string <- gsub('.{3}$', '', ids_string)

  query <- paste("SELECT t.source_trait_id, t.dbgap_variable_accession, ",
                 "e.category, e.value",
                 "FROM source_trait_encoded_values e",
                 "LEFT JOIN source_trait t ON e.source_trait_id = t.source_trait_id WHERE ",
                 ids_string)
  dbGetQuery(db, query)
}