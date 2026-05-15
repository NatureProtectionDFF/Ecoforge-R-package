#' @export
generatePoints <- 
function(x, npoints) {
  m <- apply(matrix(x, nrow(x), ncol(x), byrow = TRUE), 2, rev)
  f <- npoints / sum(m, na.rm = T) / prod(res(x))
  e <- as.vector(terra::ext(x))
  im.obj <- im(m, xrange = e[1:2], yrange = e[3:4])
  occurs <- rpoispp(im.obj*f)
  occurs
}
