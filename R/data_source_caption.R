#' Add data source caption to figure
#'
#' Citation information is retrieved from data attributes and used to create a data source caption.
#'
#' @param data
#'
#' @return
#' @export
#'
#' @examples
#'
#' ptt_read_data("tyonv_1001", "KOKO MAA") %>%
#'   filter(tiedot_code == "AVPAIKAT") %>%
#'   { ggplot(., aes(x = time, y = values)) +
#'     geom_line() +
#'     geom_smooth() +
#'     labs(x = NULL,
#'          y = attributes(.)$codes_names$tiedot["AVPAIKAT"]) +
#'      data_source_caption(.)
#'    }
data_source_caption <- function(data) {

  if(is.null(attributes(data)$citation)) {
     message("No citation information found to create caption.")
  }
  labs(caption = paste("Data source:",
                              attributes(data)$citation$author,
                              attributes(data)$citation$table_code,
                              sep = " "))
}
