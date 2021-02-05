#' Map the location of fatal motor vehicle accidents in selected state in the US by given year
#'
#' @param state.num The numerical number representing the state you would like to plot
#' @param year The year of which you would like to plot accidents from
#' @return returns a map of the requested state with dots representing each accident
#' @note Will return an error if invalid state number given
#' @note Will return an error if a year with no data is given
#' @note Will return a message saying "no accidents to plot" if there were no
#' accidents in the state in the year requested
#'
#' @importFrom dplyr filter
#' @importFrom maps map
#' @importFrom graphics points
#'
#' @export
fars_map_state <- function(state.num, year) {
  filename <- make_filename(year)
  data <- fars_read(filename)
  state.num <- as.integer(state.num)

  if(!(state.num %in% unique(data$STATE)))
    stop("invalid STATE number: ", state.num)
  data.sub <- dplyr::filter(data, STATE == state.num)
  if(nrow(data.sub) == 0L) {
    message("no accidents to plot")
    return(invisible(NULL))
  }
  is.na(data.sub$LONGITUD) <- data.sub$LONGITUD > 900
  is.na(data.sub$LATITUDE) <- data.sub$LATITUDE > 90
  with(data.sub, {
    maps::map("state", ylim = range(LATITUDE, na.rm = TRUE),
              xlim = range(LONGITUD, na.rm = TRUE))
    graphics::points(LONGITUD, LATITUDE, pch = 46)
  })
}
