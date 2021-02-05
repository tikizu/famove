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
#' @examples
#' \dontrun{
#' if(interactive()){
#' filefromfamove <- system.file("extdata", "accident_2014.csv.bz2", package = "famove")
#' fars_read(filefromfamove)
#' }
#' }
#' @export

fars_read <- function(filename) {
  if(!file.exists(filename))
    stop("file '", filename, "' does not exist")
  data <- suppressMessages({
    readr::read_csv(filename, progress = FALSE)
  })
  dplyr::as_tibble(data)
}
