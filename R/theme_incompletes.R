#' Theme elements
#'
#' Convinient functions to set theme elements.
#'
#' Shortcuts to modify theme elements with \code{\link{theme}}.
#'
#' @param blanks In \code{the_title_blank} a vector of initial for blank titles.
#' A default is all titles: \code{c("x", "y", "t", "l")} for x-axis, y-axis, plot title and legend.
#' @export
#'
the_x45 <- function() theme(axis.text.x = element_text(angle = 45, hjust = 1))

#' @describeIn the_x45 legend.position = "bottom"
#' @export
the_legend_bot <- function() theme(legend.position = "bottom")

#' @describeIn the_x45 blank titles
#' @export
the_title_blank <- function(blanks = c("x", "y", "t", "l")){
  blank_list <- list(axis.title.x = element_blank(),
                     axis.title.y = element_blank(),
                     plot.title = element_blank(),
                     legend.title = element_blank())
  do.call("theme", blank_list[c(x = 1, y = 2, t = 3, l = 4)[blanks]])
}
