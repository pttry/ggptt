#' Depict regional data on map
#'
#' Tämä funktio piirtää datan Suomen kartalle käyttäjän määrittelemällä aluejaolla ja aluejaon vuodella.
#'
# Huom. ottaa tällä hetkellä datan vastaan ainoastaan pitkässä muodossa. Argumentti x on arvo muuttujassa
# 'tiedot_code'
#'
#' @param data data.frame
#' @param vuosi kartan vuosi
#' @param aluejako kartan aluejako
#' @param x muuttuja
#' @param time
#'
#' @return figure
#' @export dplyr
#'
#'
#' @examples
#'
#' pttdatahaku::ptt_read_data("tyonv_1001", "kunta") %>% ptt_draw_map(2020, "kunta", "TYOTOSUUS")
#' pttdatahaku::ptt_read_data("tyonv_1001", "seutukunta") %>% ptt_draw_map(2020, "seutukunta", "TYOTOSUUS")
#' pttdatahaku::ptt_read_data("tyonv_1001", "maakunta") %>% ptt_draw_map(2020, "maakunta", "TYOTOSUUS")
#'
ptt_draw_map <- function(data, vuosi, aluejako, x, time = max(data$time)) {

  capabilities <- xml2::read_xml("https://geo.stat.fi/geoserver/tilastointialueet/wfs?service=WFS&version=2.0.0&request=GetCapabilities")
  map_names <- capabilities %>%
    xml2::xml_find_all("//wfs:FeatureType/wfs:Name") %>%
    xml2::xml_text()
  file <- tail(grep(paste0("tilastointialueet:", aluejako), grep(vuosi, map_names, value = TRUE), value = TRUE), n = 1)

  url <- httr::parse_url("https://geo.stat.fi/geoserver/tilastointialueet/wfs")
  url$query <- list(service ="WFS",
                     version ="2.0.0",
                     request ="GetFeature",
                     typename = file,
                     outputFormat ="application/json")

  prefix_name_key <- c("kunta" = "KU", "seutukunta" = "SK", "maakunta" = "MK", "suuralue" = "SA")

  map <- sf::st_read(httr::build_url(url))
  map[[aluejako]] <- paste0(prefix_name_key[aluejako], map[[aluejako]])
  map <- dplyr::rename_with(map, ~paste0(aluejako, "_code"), aluejako)

  data <- dplyr::filter(data, tiedot_code == x, time == time) %>%
          tidyr::spread(tiedot_code, values)

  output <- map %>%
             dplyr::left_join(data, by = paste0(aluejako, "_code")) %>%
             ggplot(aes_string(fill = x)) + geom_sf()
  output
}