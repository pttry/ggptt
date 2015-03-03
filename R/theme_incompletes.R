
#' Convinient functions to set theme elements
#'
#' Shortcuts to modify theme elements with \code{\link{theme}}
#'
#' @export
#'
#' @section Functions:
#'
#' \tabular{ll}{
#'    the_x45 \tab x-axis text in 45 angle \cr
#'    the_legend_bot \tab legend.position = "bottom" \cr
#'  }
#'
the_x45 <- function() theme(axis.text.x = element_text(angle = 45, hjust = 1))

#' @describeIn the_x45
#' @export
the_legend_bot <- function() theme(legend.position = "bottom")
