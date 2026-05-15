\name{abundance2pres}
\alias{abundance2pres}
\title{
Convert abundance to presence data
}
\description{
Converts abundance data to presence data with imperfect detection.
}
\usage{
abundance2pres(abun, ipd)
}
\arguments{
  \item{abun}{
A data.frame with the first column with the sample id and the second with abundance values
}
  \item{ipd}{
A numeric value that determines the individual probability of detection followin a binomial distribution.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
Returns a data frame with the abundance of each unit and the presence/absence data.
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
