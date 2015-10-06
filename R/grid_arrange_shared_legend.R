#' Share a legend between ggplot2 graphs
#'
#' @param ... ggplot plots,
#' @param ncol A number of columns for plots in the plot.
#' @export
#' @return grop and should be plot with \code{\link[grid]{grid.draw}}
#' @author Shaun Jackman and Janne Huovari
#' @seealso \link{https://github.com/hadley/ggplot2/wiki/Share-a-legend-between-two-ggplot2-graphs}
#' @examples
#' dsamp <- diamonds[sample(nrow(diamonds), 1000), ]
#' p1 <- qplot(carat, price, data=dsamp, colour=clarity)
#' p2 <- qplot(cut, price, data=dsamp, colour=clarity)
#' p3 <- qplot(color, price, data=dsamp, colour=clarity)
#' p4 <- qplot(depth, price, data=dsamp, colour=clarity)
#' grid_arrange_shared_legend(p1, p2, p3, p4, ncol = 2)

grid_arrange_shared_legend <- function(..., ncol = 1) {
  plots <- list(...)
  g <- ggplot2::ggplotGrob(plots[[1]] +
                             ggplot2::theme(legend.position="bottom"))$grobs
  legend <- g[[which(sapply(g, function(x) x$name) == "guide-box")]]
  lheight <- sum(legend$height)
  gridExtra::grid.arrange(
    do.call(gridExtra::arrangeGrob,
            c(lapply(plots, function(x) x + theme(legend.position="none")),
              ncol = ncol)),
    legend,
    ncol = 1,
    heights = grid::unit.c(grid::unit(1, "npc") - lheight, lheight))
}
