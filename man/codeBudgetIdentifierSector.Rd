% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{codeBudgetIdentifierSector}
\alias{codeBudgetIdentifierSector}
\title{codeBudgetIdentifierSector}
\format{
A data frame with 31 rows and 6 variables:
\describe{
  \item{\code{code}}{double COLUMN_DESCRIPTION}
  \item{\code{name}}{character COLUMN_DESCRIPTION}
  \item{\code{description}}{logical COLUMN_DESCRIPTION}
  \item{\code{category}}{double COLUMN_DESCRIPTION}
  \item{\code{url}}{logical COLUMN_DESCRIPTION}
  \item{\code{status}}{character COLUMN_DESCRIPTION}
}
}
\source{
\url{https://iatistandard.org/en/iati-standard/203/codelists/}
}
\usage{
codeBudgetIdentifierSector
}
\description{
This codelists exists to group the Budget Identifier codelist
into sectors. It is not used as a codelist in its own right.
  This is a Non-Core codelist.
}
\examples{
{
knitr::kable(head(codeBudgetIdentifierSector, 10))
}
}
\keyword{datasets}
