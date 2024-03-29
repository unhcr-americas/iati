% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{dataResult}
\alias{dataResult}
\title{dataResult}
\format{
A data frame  
\describe{
  \item{\code{iati_identifier}}{character A globally unique identifier for the activity.}
  \item{\code{result_type}}{double COLUMN_DESCRIPTION}
  \item{\code{result_title}}{character COLUMN_DESCRIPTION}
  \item{\code{result_indicator_title}}{character COLUMN_DESCRIPTION}
  \item{\code{result_indicator_measure}}{double COLUMN_DESCRIPTION}
  \item{\code{result_indicator_aggregation_status}}{character COLUMN_DESCRIPTION}
  \item{\code{result_indicator_ascending}}{character COLUMN_DESCRIPTION}
  \item{\code{result_indicator_reference_code}}{logical COLUMN_DESCRIPTION}
  \item{\code{result_indicator_reference_uri}}{logical COLUMN_DESCRIPTION}
  \item{\code{result_indicator_reference_vocabulary}}{logical COLUMN_DESCRIPTION}
  \item{\code{result_indicator_baseline_location_ref}}{character COLUMN_DESCRIPTION}
  \item{\code{result_indicator_baseline_value}}{character COLUMN_DESCRIPTION}
  \item{\code{result_indicator_baseline_year}}{character COLUMN_DESCRIPTION}
  \item{\code{result_indicator_baseline_date}}{logical COLUMN_DESCRIPTION}
  \item{\code{result_indicator_baseline_dimension_1}}{character COLUMN_DESCRIPTION}
  \item{\code{result_indicator_baseline_dimension_value_1}}{character COLUMN_DESCRIPTION}
  \item{\code{result_indicator_baseline_dimension_2}}{character COLUMN_DESCRIPTION}
  \item{\code{result_indicator_baseline_dimension_value_2}}{character COLUMN_DESCRIPTION}
  \item{\code{result_indicator_period_start}}{character COLUMN_DESCRIPTION}
  \item{\code{result_indicator_period_end}}{character COLUMN_DESCRIPTION}
  \item{\code{result_indicator_target_value}}{character COLUMN_DESCRIPTION}
  \item{\code{result_indicator_target_location_ref}}{character COLUMN_DESCRIPTION}
  \item{\code{result_indicator_target_dimension_1}}{character COLUMN_DESCRIPTION}
  \item{\code{result_indicator_target_value_1}}{character COLUMN_DESCRIPTION}
  \item{\code{result_indicator_target_dimension_2}}{character COLUMN_DESCRIPTION}
  \item{\code{result_indicator_target_value_2}}{character COLUMN_DESCRIPTION}
  \item{\code{result_indicator_actual_value}}{character COLUMN_DESCRIPTION}
  \item{\code{result_indicator_actual_location_ref}}{character COLUMN_DESCRIPTION}
  \item{\code{result_indicator_actual_dimension_1}}{character COLUMN_DESCRIPTION}
  \item{\code{result_indicator_actual_value_1}}{character COLUMN_DESCRIPTION}
  \item{\code{result_indicator_actual_dimension_2}}{character COLUMN_DESCRIPTION}
  \item{\code{result_indicator_actual_value_2}}{character COLUMN_DESCRIPTION}
  \item{\code{result_type_name}}{character COLUMN_DESCRIPTION}
  \item{\code{result_type_description}}{character COLUMN_DESCRIPTION}
  \item{\code{indicator_measure_name}}{character COLUMN_DESCRIPTION}
  \item{\code{indicator_measure_description}}{character COLUMN_DESCRIPTION} 
}
}
\source{
\url{https://iatistandard.org/en/iati-standard/203/}
}
\usage{
dataResult
}
\description{
DATASET_DESCRIPTION
}
\examples{
{
knitr::kable(head(dataResult, 10))
}
}
\keyword{datasets}
