% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/time_shift.R
\name{halfq_shift}
\alias{halfq_shift}
\title{Shift time 1.5 months}
\usage{
halfq_shift(x)
}
\arguments{
\item{x}{a Date vector to shift}
}
\description{
Used to shift time a half quarter in quarter charts
}
\examples{
halfq_shift(as.Date(c("2018-01-01", "2018-04-01")))

}
