#' Create character string containing a file name
#'
#' @param year the year for which the file name is created
#' @return a CSV filename as a character string
#'
#' @export
make_filename <- function(year) {
  year <- as.integer(year)
  sprintf("accident_%d.csv.bz2", year)
}

