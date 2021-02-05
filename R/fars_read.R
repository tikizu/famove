#' Read in a CSV file
#'
#' Create a tibble from CSV file
#'
#' @param filename as a character
#'
#' @return tibble
#'
#' @importFrom readr read_csv
#' @importFrom dplyr as_tibble
#'
#'
#' @export

fars_read <- function(filename) {
  if(!file.exists(filename))
    stop("file '", filename, "' does not exist")
  data <- suppressMessages({
    readr::read_csv(filename, progress = FALSE)
  })
  dplyr::as_tibble(data)
}
