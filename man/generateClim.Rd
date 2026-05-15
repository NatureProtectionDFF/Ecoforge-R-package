\name{generateClim}
\alias{generateClim}
\title{
Generates a base climate data with Gaussian simulations with Spherical model.
}
\description{
Function to generate base climate data using Gaussian simulations with a Spherical 
model. The temperature data adheres to a normal distribution, while precipitation 
follows a lognormal distribution with user-defined parameters, and both variables
are treated as independent. Daily precipitation amplitude covaries with latitude 
and temperature data. Temperature annual range and precipitation annual variation
are determined by the latitudinal gradient with the addition of a normal error.
}
\usage{
generateClim(nrow = 101, ncol = 101, Tmean = 15, Tsd = 4, Trange = 45, 
             Tamp_max = 10, Tamp_min = 1, Tar_max = 10, Tar_min = 5, 
             Pmean = 500, Psd = 300, Prange = 45, Pav_max = 50, Pav_min = 10)
}
\arguments{
  \item{nrow}{
Row number of the grid to be created.
}
  \item{ncol}{
Column number of the grid to be created.
}
  \item{Tmean}{
Mean temperature of the distribution.
}
  \item{Tsd}{
Standard deviation for temperature distribution.
}
  \item{Trange}{
Range for the spatial autocorrelation spherical model.
}
  \item{Tamp_max}{
Maximum daily amplitude for temperature.
}
  \item{Tamp_min}{
Minimum daily amplitude for temperature.
}
  \item{Tar_max}{
Maximum value for temperature annual range.
}
  \item{Tar_min}{
Minimum value for temperature annual range.
}
  \item{Pmean}{
Mean value for precipitation distribution.
}
  \item{Psd}{
Standard deviation value for precipitation distribution.
}
  \item{Prange}{
Range for the spatial autocorrelation model.
}
  \item{Pav_max}{
Maximum value for precipitation annual variation.
}
  \item{Pav_min}{
Minimum value for precipitation annual variation.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
Returns a list with generated grid coordinates and temperature, 
precipitation, daily temperature amplitude and temperature annual range and
precipitation annual variation for each cell. Coordinates are always in the
range [0,1].
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
clim <- generateClim()

clim.rst <- rast(clim)
plot(clim.rst)

# Higher temperature, low precipitation
clim2 <- generateClim(Tmean=24, Pmean=25, Psd=50)
clim2.rst <- rast(clim2)
plot(clim2.rst)

# Higher spatial resolution
clim3 <- generateClim(200, 200)
clim3.rst <- rast(clim3)
plot(clim3.rst)

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
