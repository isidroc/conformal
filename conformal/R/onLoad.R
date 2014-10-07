.onLoad <- function(libname, pkgname) {
  packageStartupMessage( "Conformal prediction in R. Isidro Cortes-Ciriano <isidrolauscher@gmail.com>" )
    require(ggplot2) || stop("Pacakge 'ggplot2' is required")
    require(grid) || stop("Pacakge 'grid' is required")
    require(caret) || stop("Pacakge 'caret' is required")
}
