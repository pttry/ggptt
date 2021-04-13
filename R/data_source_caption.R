#' Add data source caption to figure
#'
#' Citation information is retrieved from data attributes and used to create a data source caption.
#'
#' @param data a data
#' @param citation an alternative citation object
#' @param text a text to precide a citation.
#' @param author A locigal whether to include an author.
#'
#' @return
#' @export
#'
#' @examples
#'
#' pttdatahaku::ptt_read_data("tyonv_1001", "KOKO MAA") %>%
#'   dplyr::filter(tiedot_code == "AVPAIKAT") %>%
#'   { ggplot(., aes(x = time, y = values)) +
#'     geom_line() +
#'     geom_smooth() +
#'     labs(x = NULL,
#'          y = attributes(.)$codes_names$tiedot["AVPAIKAT"]) +
#'      data_source_caption(.)
#'    }
#'
#' pttdatahaku::ptt_read_data("tyonv_1001", "KOKO MAA") %>%
#'   dplyr::filter(tiedot_code == "AVPAIKAT") %>%
#'   { ggplot(., aes(x = time, y = values)) +
#'     geom_line() +
#'     geom_smooth() +
#'     labs(x = NULL,
#'          y = attributes(.)$codes_names$tiedot["AVPAIKAT"]) +
#'      data_source_caption(., author = FALSE, text = "Tilastolähde")
#'    }
#'
#' data <- pttdatahaku::ptt_read_data("tyonv_1001", "KOKO MAA")
#'
#' cit <- attributes(data)$citation
#'
#' data %>%
#'   dplyr::filter(tiedot_code == "AVPAIKAT") %>%
#'   { ggplot(., aes(x = time, y = values)) +
#'     geom_line() +
#'     geom_smooth() +
#'     labs(x = NULL,
#'          y = attributes(.)$codes_names$tiedot["AVPAIKAT"]) +
#'      data_source_caption(., author = FALSE, citation = cit, text = "Tilastolähde: Tilastokeskus")
#'    }
#'
#'
data_source_caption <- function(data,
                                citation = NULL,
                                text = "Data source:",
                                author = TRUE) {

  if(is.null(attributes(data)$citation) & is.null(citation)) {
     message("No citation information found to create caption.")
  }

  if(is.null(citation)) {
    citation <- attributes(data)$citation
  }

  labs(caption = paste(text,
                       if(author) {citation$author} else {""},
                       citation$table_code,
                       sep = " "))
}
