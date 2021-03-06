% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/breaks.R
\name{extra_breaks}
\alias{extra_breaks}
\title{Add extra breaks to a continuous scale}
\usage{
extra_breaks(extras)
}
\arguments{
\item{extras}{a numeric vector of extra breaks.}
}
\description{
Add extra breaks to default breaks of \code{\link[ggplot2]{scale_continuous}}.
}
\examples{
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  scale_y_continuous(breaks = extra_breaks(25))

}
