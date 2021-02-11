#' Depict regional data on map
#'
#' Tämä funktio piirtää datan Suomen kartalle käyttäjän määrittelemällä aluejaolla ja aluejaon vuodella.
#'
#'
#' @param data data.frame
#' @param vuosi kartan vuosi
#' @param aluejako kartan aluejako
#' @param x arvo muuttujassa \code{tiedot_code}
#' @param time time of data.
#' @param grid logical, whether grid with coordinates is drawn. Defaults to TRUE
#' @param long_data logical, whether input data is in the long form. Defaults to TRUE.
#'
#' @return figure
#'
#' @import dplyr
#' @export
#'
#'
#' @examples
#'
#' pttdatahaku::ptt_read_data("tyonv_1001", "kunta") %>%
#'      ptt_draw_map( x = "TYOTOSUUS", map_year = 2020, aluejako = "kunta")
#' pttdatahaku::ptt_read_data("tyonv_1001", "seutukunta") %>%
#'      ptt_draw_map(x = "TYOTOSUUS", map_yea = 2020, aluejako = "seutukunta")
#' pttdatahaku::ptt_read_data("tyonv_1001", "maakunta") %>%
#'      ptt_draw_map( x = "TYOTOSUUS", map_year = 2020) +
#'      scale_fill_gradient(low = "white", high = ggptt_palettes$ptt_new[1]) +
#'        theme(legend.position = "top",
#'              legend.justification = "left")
#'
ptt_draw_map <- function(data,
                         x,
                         map_year = substring(max(data$time), 1,4),
                         aluejako = NULL,
                         time = max(data$time),
                         grid = TRUE,
                         long_data = TRUE) {



  if(is.null(aluejako)) {
   aluejako <- stringr::str_remove(grep("_code", statficlassifications::detect_region_var(data)$name_key, value = TRUE), "_code")
  }


  if(!is.null(attributes(data)$codes_names$tiedot)) {
    codes_names_tiedot <-attributes(data)$codes_names$tiedot
  } else {
    codes_names_tiedot <- NULL
  }

  # Get a list of all available maps
  capabilities <- xml2::read_xml("https://geo.stat.fi/geoserver/tilastointialueet/wfs?service=WFS&version=2.0.0&request=GetCapabilities")
  map_names <- capabilities %>%
    xml2::xml_find_all("//wfs:FeatureType/wfs:Name") %>%
    xml2::xml_text()

  # Filter the required map from the list of all maps
  file <- tail(grep(paste0("tilastointialueet:", tolower(aluejako)),
                    grep(as.character(map_year), map_names, value = TRUE),
                    value = TRUE),
               n = 1)

  # Test if the search was successful
  if(length(file) == 0) {stop("Map not found!")}

  url <- httr::parse_url("https://geo.stat.fi/geoserver/tilastointialueet/wfs")
  url$query <- list(service ="WFS",
                     version ="2.0.0",
                     request ="GetFeature",
                     typename = file,
                     outputFormat ="application/json")

  prefix_name_key <- c("kunta" = "KU", "seutukunta" = "SK", "maakunta" = "MK", "suuralue" = "SA")

  # Get map and modify region variable
  map <- sf::st_read(httr::build_url(url), quiet = TRUE)
  map[[aluejako]] <- paste0(prefix_name_key[aluejako], map[[aluejako]])
  map <- dplyr::rename_with(map, ~paste0(aluejako, "_code"), aluejako)

  # Filter required from the input data
  if(long_data) {
    data <- dplyr::filter(data, tiedot_code == x, time == time) %>%
      tidyr::spread(tiedot_code, values)
  }

  output <- map %>%
             dplyr::left_join(data, by = paste0(aluejako, "_code")) %>%
             ggplot(aes_string(fill = x)) +
                 geom_sf() +
                 labs(fill = ifelse(!is.null(codes_names_tiedot),
                                    codes_names_tiedot[x], x))

  if(!grid) {
    output <- output + theme(panel.grid.major = element_line(colour = "transparent"),
                             panel.border = element_rect(color = "transparent"),
                             plot.background = element_rect(color = "transparent")) +
                       coord_sf(datum = NA)
  }


  output
}

