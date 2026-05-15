\name{generateVar}
\alias{generateVar}
\title{
Generates a simple autocorrelated variable data with Gaussian simulations with Spherical model.
}
\description{
Generates a new variable data with Gaussian simulations with Spherical model 
where we can control some parameters of this variables (mean, deviation and 
spatial autocorrelation).
Can be used, for instance, to create a variable simulating and spatially
aggregated patter as vegetation patches.
}
\usage{
generateVar(nrow, ncol, Vmean, Vsd, Vrange)
}
\arguments{
  \item{nrow}{
Row number of the grid to be created.
}
  \item{ncol}{
Column number of the grid to be created.
}
  \item{Vmean}{
Mean value of the variabl to be created.
}
  \item{Vsd}{
Standard deviation for variable distribution.
}
  \item{Vrange}{
Range distance for the autocorrelation model.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
Returns a data frame with generated grid coordinates and values generated.
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
var <- generateVar(101, 101, 1, 0.1, 15)
rst <- rast(var, type="xyz")

plot(rst)

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
