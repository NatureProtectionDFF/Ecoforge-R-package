\name{generateMonthlyTemp}
\alias{generateMonthlyTemp}
\title{
Generates monthly data for minimum, average and maximum temperature.
}
\description{
Generates monthly temperature data, including minimum, average, and maximum values.
The data generation process involves hourly calculations across 12 months, incorporating
a seasonality pattern derived from a simple cosine function, with a peak during summer (July-August), 
plus daily peaks (centered around 12:00), and a spatially independent
normal error.
}
\usage{
generateMonthlyTemp(x, daily_amp, annual_rng, err_sdev = 1, verbose = TRUE)
}
\arguments{
  \item{x}{
A vector with average annual temperature data.
}
  \item{daily_amp}{
A vector with same length as 'x' with daily temperature amplitude.
}
  \item{annual_rng}{
A vector with same length as 'x' with temperature annual range.
}
  \item{err_sdev}{
Standard deviation for normal error associated with each hour "measurement".
}
  \item{verbose}{
Logic value for verbosity (default is TRUE).
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
Returns a list with tmin, tavg and tmax matrices with data for each cell
(rows) and for each month (columns).
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
set.seed(1234)

# Generate base climate data
clim <- generateClim()
  
# Generate monthly precipitation for each cell
m_temp <- generateMonthlyTemp(clim$temp, clim$daily_amp, clim$annual_range)
  
# Average temperature per month across all cells
monthly_avg <- colMeans(m_temp$tavg)
barplot(monthly_avg, names.arg = month.abb,
          xlab = "Month", ylab = "Temperature (ºC)",
          main = "Average monthly temperature")

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
