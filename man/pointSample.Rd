\name{pointSample}
\alias{pointSample}
\title{
Calculates distances between locations and sampling sites based on detection range.
}
\description{
Determine de euclidean distance from each occurrence to each survey (point), and
mantain only the distances to each survey unit for occurrences inside a limiting
distance of detection
}
\usage{
pointSample(sites, occ, radius)
}
\arguments{
  \item{sites}{
Data.frame with position (x, y) for each point survey (in rows).
}
  \item{occ}{
Data.frame with position (x, y) for each occurrence (in rows).
}
  \item{radius}{
A numeric value indicating the maximum distance of detection of the occurrence point in the survey.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
Returns a list with a matrix with occ (rows) x sites (cols) with values of distance if less than radius, otherwise NA.
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

# Generate random occurrences and sampling sites
obs <- data.frame(x=runif(1000, 0, 100), y=runif(1000, 0, 100))
sites <- randomSamp(25, c(0, 100), c(0, 100), 20)

#Get the distance matrix from a point sampling procedure with detection radius of 5 units
detrange <- 5
psamp <- pointSample(sites, obs, radius = detrange)

plot(obs, cex=0.3, asp=1)
points(sites, cex=0.6, pch=3, col='red')
points(sites, cex=detrange, pch=21, col='red', bg = NULL)

for (i in 1:nrow(sites)) {
  d <- psamp$distance[,i]
  msk <- !is.na(d)
  col <- as.integer(cut(d[msk], seq(0, detrange, length.out=5)))
  points(obs[msk,], pch=16, cex=1, col=rainbow(10)[col]) 
}

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
