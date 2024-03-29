% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/palettes.R
\name{ggptt_pal}
\alias{ggptt_pal}
\title{Color palettes in ggptt package.}
\usage{
ggptt_pal(n = NULL, name, last_grey = FALSE)
}
\arguments{
\item{n}{A number of colour needed. NULL (default) return all available.}

\item{name}{A name of the palette. See \code{names(ggptt_palettes)}.}
}
\description{
Color palettes in ggptt package (discrete).
}
\details{
Colors in palerres are recycled if needed (with warning).

Available palettes are: ptt, vnk.
}
\examples{
 scales::show_col(ggptt_pal(n = 6, name = "ptt"))
 scales::show_col(ggptt_pal(n = 6, name = "vnk"))
 scales::show_col(ggptt_pal(n = 6, name = "ptt", last_grey = TRUE))
}
\seealso{
Other ggptt_pal: 
\code{\link{aw_pal}()},
\code{\link{ptt_pal}()},
\code{\link{vnk_pal}()}
}
\concept{ggptt_pal}
