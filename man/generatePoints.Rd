\name{generatePoints}
\alias{generatePoints}
\title{
Create a distribution of points in the space based on a raster layer of the same extension.
}
\description{
Generates a series of points based on an inhomogeneous Poisson process for 
random point generation. 
}
\usage{
generatePoints(x, npoints)
}
\arguments{
  \item{x}{
a SpatRaster object representing intensity of the Poisson process.
}
  \item{npoints}{
An indication of the approximate number of points to be created. As it is based
on a stochastic process, it indicates an average number of points to generate
for the total area, distributed acordingly to the intensity 'x' but it rarely be
exactly the number.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
Returns a ppp object with a data frame containing the generated grid coordinates and values generated.
}
\references{
}
\author{
}
\note{
}

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
set.seed(1234)

# With default parameters
var <- generateVar(100, 100, 10, 1, 15)

# apply a logitic transformation to values
var$value <- logistic(var$value, 10, 1, 3)

rst <- rast(var, type="xyz")
pnt <- generatePoints(rst, 100000)
pnt

plot(rst)
points(pnt, cex=0.25)


}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory (show via RShowDoc("KEYWORDS")):
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }
% Use only one keyword per line.
% For non-standard keywords, use \concept instead of \keyword:
% \concept{ ~cpt1 }
% \concept{ ~cpt2 }
% Use only one concept per line.
