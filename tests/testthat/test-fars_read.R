test_that("fars_read works", {
  filefromfamove <- system.file("extdata", "accident_2013.csv.bz2", package = "famove")
  fars_read(filefromfamove)
})
