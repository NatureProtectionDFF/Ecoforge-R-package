#' @export
logistic <- 
function(x, x0, L, k) {
  l <- L / (1 + exp(-k * (x - x0)))
  return(l)
}
