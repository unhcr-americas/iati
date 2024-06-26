% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{codeHumanitarianScopeVocabulary}
\alias{codeHumanitarianScopeVocabulary}
\title{codeHumanitarianScopeVocabulary}
\format{
A data frame with 3 rows and 6 variables:
\describe{
  \item{\code{code}}{double code}
  \item{\code{name}}{character name}
  \item{\code{description}}{character description}
  \item{\code{category}}{double  category}
  \item{\code{url}}{character url}
  \item{\code{status}}{character status}
}
}
\source{
\url{https://iatistandard.org/en/iati-standard/203/codelists/}
}
\usage{
codeHumanitarianScopeVocabulary
}
\description{
The Humanitarian Scope Vocabulary codelist defines a range of
external codelists which themselves provide codes and descriptions for
humanitarian events and actions.
}
\examples{
{
knitr::kable(head(codeHumanitarianScopeVocabulary, 10))
}
}
\keyword{datasets}
