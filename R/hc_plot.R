#' A PTT theme for highcharts plots
#'
#' @export
#' @import highcharter


hc_theme_ptt <- function(){
  highcharter::hc_theme_merge(
    highcharter::hc_theme_smpl(),
    highcharter::hc_theme(
      colors = ptt_pal(),
      chart = list(
        backgroundColor = NULL
      )
    )
  )
}

#' PTT highcharts lineplot with highlihted series.
#'
#' data modification is done internally by \code{\link{hcptt_prepare_line_data}}.
#'
#' @param data a data.frame
#' @param group a grouping variable.
#' @param xaxis a x-axis variable.
#' @param values a data variable.
#' @param highlight a sting, subset of group to highlight.
#' @param theme a theme to use.
#'
#' @export
#' @examples
#'   pdat <- dplyr::select(economics, date, psavert, uempmed)
#'   pdat <- dplyr::mutate(pdat, uempmed2 = uempmed + 1)
#'   pdat <- tidyr::gather(pdat, vars, values, -date)
#'
#'   hcptt_hl_linechart(pdat, group = vars, xaxis = date,
#'   values = values, highlight = c("uempmed", "uempmed2"))
#'

hcptt_hl_linechart <- function(data, group, xaxis, values, highlight,
                               theme = hc_theme_ptt()) {
  #data
  dat <- hcptt_prepare_line_data(x = {{ data }}, {{group}}, {{xaxis}}, {{values}}, {{highlight}})

  #colours
  cols <- rep("#999", length(dat[[2]])) # basic grey
  sel_ind <- sapply(dat[[2]], function(x) x$zIndex == 1) # highlighted
  cols[sel_ind] <- theme$colors[seq_len(sum(sel_ind))] # replace highlighted
  theme$colors[unique(c(which(sel_ind), seq_along(theme$colors)))] <- theme$colors


  #plot
  highchart() %>%
    hc_xAxis(categories = dat[[1]]) %>%
    hc_add_series_list(dat[[2]]) %>%
    hc_add_theme(theme) %>%
    hc_colors(cols) %>%
    hc_plotOptions(series = list(events = list(
      legendItemClick = JS(
        "function(event) {
     event.preventDefault();
     var col = this.color;
     if(col == '#999') {
        col = Highcharts.getOptions().colors[this.index];
        lineWd = 4;
        zInd = 2
     }
     else {
        col = '#999';
        lineWd = 2;
        zInd = 0
     }
     this.update({
        color: col,
        lineWidth: lineWd,
        zIndex: zInd
        });
    }"
      )
    )))
}
