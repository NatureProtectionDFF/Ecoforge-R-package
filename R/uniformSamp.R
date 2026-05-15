uniformSamp <- function(xrange, yrange, cellsize) {
  s <- cellsize/2
  grd <- expand.grid(x=seq(xrange[1]+s, xrange[2]-s, s),
                     y=seq(yrange[1]+s, yrange[2]-s, s))
}
