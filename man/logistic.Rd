\name{logistic}
\alias{logistic}
\title{
Logistic function of data.
}
\description{
Transforms the data with a logistic function.
}
\usage{
logistic(x, x0, L, k)
}
\arguments{
  \item{x}{
Values to transform (a vector, a SpatRaster, or other data types where mathematical functions can be applied)
}
  \item{x0}{
value of x that indicates the point of inflexion.
}
  \item{L}{
value that indicates the highest value for trasnformed data.
}
  \item{k}{
value that indicates the softness of the curve.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
Returns a transformed object of same data type as x.
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

# random values
val <- runif(1000, 0, 10)

# apply a logitic transformation to values
lval <- logistic(val, 5, 1, 1)

plot(val, lval, cex=0.2)


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
