% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{dataBudget}
\alias{dataBudget}
\title{dataBudget}
\format{
A data frame with 12 variables:
\describe{
  \item{\code{iati_identifier}}{character COLUMN_DESCRIPTION}
  \item{\code{budget_type}}{double COLUMN_DESCRIPTION}
  \item{\code{budget_status}}{double COLUMN_DESCRIPTION}
  \item{\code{budget_period_start}}{character COLUMN_DESCRIPTION}
  \item{\code{budget_period_end}}{character COLUMN_DESCRIPTION}
  \item{\code{budget_currency}}{character COLUMN_DESCRIPTION}
  \item{\code{budget_value_date}}{character COLUMN_DESCRIPTION}
  \item{\code{budget_value}}{double COLUMN_DESCRIPTION}
  \item{\code{budget_type_name}}{character COLUMN_DESCRIPTION}
  \item{\code{budget_type_description}}{character COLUMN_DESCRIPTION}
  \item{\code{budget_status_name}}{character COLUMN_DESCRIPTION}
  \item{\code{budget_status_description}}{character COLUMN_DESCRIPTION} 
}
}
\source{
\url{https://iatistandard.org/en/iati-standard/203/}
}
\usage{
dataBudget
}
\description{
Display budget by operation
}
\examples{
{
knitr::kable(head(dataBudget, 10))
}
}
\keyword{datasets}
