#' Horizontal line on 0.
#'
#' This geom allows you to annotate the plot with horizontal lines on y = 0.
#'
#' @export
#' @import ggplot2
#' @examples
#' p <- ggplot(mtcars, aes(x = wt, y=mpg)) + geom_point()
#'
#' p + geom_h0()
geom_h0 <- function(){
  geom_hline(aes(yintercept = 0))
}