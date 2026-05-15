#' @export
pointSample <- function(sites, occ, radius) {
  d <- matrix(NA, nrow(occ), nrow(sites))
  for (i in 1:nrow(sites)) {
    pnt <- unlist(sites[i, ])
    euc <- sqrt(colSums((t(occ) - pnt)**2))
    d[euc <= radius, i] <- euc[euc <= radius]
  }
  return(list(distance = d))
}
