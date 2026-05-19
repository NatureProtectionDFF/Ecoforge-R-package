\name{uniformSamp}
\alias{uniformSamp}
\title{
Create sampling points based on uniform sampling grid centroids.
}
\description{
Establish sampling points as a grid defined by X and Y ranges and a specified cell size.
}
\usage{
uniformSamp(xrange, yrange, cellsize)
}
\arguments{
  \item{xrange}{
Vector of two elements idnicating x coordinates range (min,max).
}
  \item{yrange}{
Same as above for y range.
}
  \item{cellsize}{
Cell size for grid (minimum dist between points)
}
}
\details{
}
\value{
Returns a table of coordinates of the sampling sites.
}
\references{
}
\author{
}
\note{
}


\seealso{
}
\examples{
# Create uniform sampling grid in a 100x100 grid.
sampling <- uniformSamp(c(0,100), c(0,100), 10)
plot(sampling, pch = 16, col = "blue",
     xlab = "x", ylab = "y",
     main = "Uniform sampling grid")
}

