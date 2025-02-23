% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/alt_text.R
\name{gen_alt_text}
\alias{gen_alt_text}
\title{Generate alt-text}
\usage{
gen_alt_text()
}
\value{
alt-text
}
\description{
Generates alt-text for the last drawn plot.
}
\details{
Currently uses Google's Gemini. You have to provide `GOOGLE_API_KEY` in the
`.Renviron`. For more, see R-package `ellmer`.
}
