#' Read CSV by Years
#'
#' reads in years from a data frame.
#'
#' @param years An integer or a vector of integers for year(s) to take data from
#' @return Returns a tibble with two columns MONTH and Year.
#' @note Will return an error if given year is invalid.
#'
#' @importFrom dplyr mutate
#' @importFrom dplyr select
#'
#'
#' @export
fars_read_years <- function(years) {
  lapply(years, function(year) {
    file <- make_filename(year)
    tryCatch({
      dat <- fars_read(file)
      dplyr::mutate(dat, year = year) %>%
        dplyr::select(MONTH, year)
    }, error = function(e) {
      warning("invalid year: ", year)
      return(NULL)
    })
  })
}
