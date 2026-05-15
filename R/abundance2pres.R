#' @export
abundance2pres <- function(abun, ipd) {
  occu <- as.integer(rbinom(nrow(abun), abun[, 2], ipd) > 0)

  # save all in a data.frame
  df <- data.frame(cbind(
    sampleID = abun[, 1], abundance = abun[, 2],
    occurrences = occu
  ))

  return(df)
}
