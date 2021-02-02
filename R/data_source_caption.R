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
data_source_caption <- function(data) {

  if(is.null(attributes(data)$citation)) {
     message("No citation information found to create caption.")
  }
  labs(caption = paste("Data source:",
                              attributes(data)$citation$author,
                              attributes(data)$citation$table_code,
                              sep = " "))
}
