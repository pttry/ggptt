% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/line_wrap.R
\name{line_wrap}
\alias{line_wrap}
\alias{line_wrap.default}
\alias{line_wrap.factor}
\title{Function to add new line charter to a character string}
\usage{
line_wrap(x, line_lenght = 40)

\method{line_wrap}{default}(x, line_lenght = 40)

\method{line_wrap}{factor}(x, line_lenght)
}
\arguments{
\item{x}{A character string or vector.}

\item{line_lenght}{A max row lenght (default = 40).}
}
\description{
Useful to wrap labels on several lines. Wrap on word breaks.
A factor returs factor.
}
\examples{
ggplot(mtcars, aes(x = wt, y=mpg)) + geom_point() +
  ggtitle(line_wrap("This is a unneccessary long example title to show
  how line_wrap function works"))
}
