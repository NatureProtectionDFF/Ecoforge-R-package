scale01 <- 
function(x) {
  x_std <- (x - min(x[])) / diff(range(x[]))
  x_std
}
