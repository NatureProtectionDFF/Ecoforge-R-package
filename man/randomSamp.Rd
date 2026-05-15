\name{randomSamp}
\alias{randomSamp}
\title{
Create sampling points based on random sampling grid centroids.
}
\description{
Selects sampling points within a grid defined by X and Y ranges and a specified cell size, employing a random sampling strategy.
}
\usage{
randomSamp(n, xrange, yrange, cellsize)
}
\arguments{
  \item{n}{
Number of sampling points to be created.
}
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
# Create 25 sampling sites in a square grid.
ns <- 25
sampling <- randomSamp(ns, c(0,100), c(0,100), 5)
sampling
}

