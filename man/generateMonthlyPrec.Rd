\name{generateMonthlyPrec}
\alias{generateMonthlyPrec}
\title{
Generates monthly data based on annual precipitation values.
}
\description{
Generates monthly data derived from annual precipitation values.
The generation process occurs for each month, incorporating a simple 
cosivariation-derived seasonality pattern with a low peak during summer
(July-August), plus a spatially independent normal error.
Monthly data is a decomposition of annual values, weighted by the 
corresponding variation.
}
\usage{
generateMonthlyPrec(x, annual_var, err_sdev = 0.1)
}
\arguments{
  \item{x}{
A vector with annual precipitation data.
}
  \item{annual_var}{
A vector with same length as 'x' with annual variation.
}
  \item{err_sdev}{
Standard deviation for normal error associated with each "measurement".
}
}
\details{
}
\value{
Returns a matrix with monthly precipitation data for each cell(rows) and 
for each month (columns).
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

m_prec <- generateMonthlyPrec(clim$prec, clim$prec_variation)


# Generate base climate data
clim <- generateClim()
  
# Generate monthly precipitation for each cell
m_prec <- generateMonthlyPrec(clim$prec, clim$prec_variation)
  
# Average precipitation per month across all cells
monthly_avg <- colMeans(m_prec)
barplot(monthly_avg, names.arg = month.abb,
          xlab = "Month", ylab = "Precipitation (mm)",
          main = "Average monthly precipitation")
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
