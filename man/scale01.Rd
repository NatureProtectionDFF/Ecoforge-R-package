\name{scale01}
\alias{scale01}
\title{
Min-max scaling of data.
}
\description{
Linearly transforms the data to a range from 0 to 1 using minimum and maximum values.
}
\usage{
scale01(x)
}
\arguments{
  \item{x}{
Values to transform (a vector, a SpatRaster, or other data types where mathematical functions can be applied)
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
sval <- scale01(val)

plot(val, sval, cex=0.2)


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
