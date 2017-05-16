#' Converts a vector or list of phs, pht, etc., accessions to integers
#' @param accessions A vector of dbGaP accessions
#' @import magrittr
.standardizeAccession <- function(accessions){
    accs_simplified <- accessions %>%
        lapply(sub, pattern = "^[[:alpha:]]+", replacement = "") %>%
        sapply(sub, pattern = "\\..*", replacement = "") %>%
        as.integer()

    if (any(is.na(accs_simplified))) {
      "NAs introduced: " %>%
          paste(paste(accessions[is.na(accs_simplified)], collapse = ", ")) %>%
          warning()
    }

    return(accs_simplified)
}
