\name{abundance2pres}
\alias{abundance2pres}
\title{
Convert abundance to presence data
}
\description{
Converts abundance data to presence data with imperfect detection. Considering 
imperfect detection per individual: if any of them are detected it is considered
as presence unit; if none of them are detected it is considered as absence unit.
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
set.seed(1234)

#Create random values for the required variables: 
#data frame with abundance values and the imperfect detection value
sample_id <- sample(1:10, size = 10, replace = FALSE)
abundance <- sample(0:6, size = 10, replace = TRUE)

abun_df <- data.frame(id = sample_id, abun = abundance)
head(abun_df, n = 10)

ipd <- 0.5

#Create a new data frame with a new column indicating if the species have been detected or not
pres_df <- abundance2pres(abun = abun_df, ipd = ipd)
head(pres_df, n = 10)

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
