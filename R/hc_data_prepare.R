#' Prepare data for a costumised highcharts line plot
#'
#' Prepare data for a costumised highcharts line plot. The data in long format.
#'
#' @param x a data.frame of data to plot.
#' @param group a grouping variable.
#' @param xaxis a x-axis variable.
#' @param values a data variable.
#' @param highlight a sting, subset of group to highlight.
#'
#' @import dplyr rlang
#'
#' @return a list of 2 with xAxis and series (a list).
#'
#' @examples
#'   pdat <- economics %>%
#'     select(date, psavert, uempmed) %>%
#'     mutate(uempmed2 = uempmed + 1) %>%
#'     tidyr::gather(vars, values, -date)
#'
#'   hcptt_prepare_line_data(pdat, group = vars, xaxis = date,
#'   values = values, highlight = "psavert") %>% head()
#'


hcptt_prepare_line_data <- function(x, group, xaxis, values, highlight){
  y1 <- unique(pull(x, {{ xaxis }}))
  y2 <- x %>%
    select(name = {{ group }}, data = {{ values }}) %>%
    mutate(zIndex = as.numeric(name %in% highlight),
           lineWidth = 2*(zIndex+1)) %>%
    split(., .$name) %>%
    lapply(., function(x) {
      x <- as.list(x)
      x$name <- as.character(x$name)[1]
      x$zIndex <- x$zIndex[1]
      x$lineWidth <- x$lineWidth[1]
      x
    }) %>%
    unname()
  y <- list(
    xAxis = y1,
    y2
  )
  y
}
