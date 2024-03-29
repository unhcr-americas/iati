% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/show_sectors.R
\name{show_sectors}
\alias{show_sectors}
\title{show_sectors}
\usage{
show_sectors(
  year,
  programme_lab = NULL,
  iati_identifier_ops = NULL,
  ctr_name = NULL,
  sector_vocabulary_name = "Reporting Organisation 2"
)
}
\arguments{
\item{year}{A numeric value or a list of value.}

\item{programme_lab}{A character vector corresponding to the name of the programme.}

\item{iati_identifier_ops}{A character vector corresponding to the name of the operation.}

\item{ctr_name}{A character vector corresponding to the name of the country.}

\item{sector_vocabulary_name}{sector_vocabulary}
}
\value{
a graph
}
\description{
What are the most funded sectors per country (Expenditure evolution per impact /outcome area)?
}
\examples{
knitr::kable( iati::dataSector |> 
                dplyr::select( sector_vocabulary_name, sector_vocabulary_description) |>
                dplyr::distinct() |>
                dplyr::filter(!(is.na(sector_vocabulary_name))))
show_sectors(
  year =  c(2020, 2021, 2022), 
  ctr_name = "Brazil",
  sector_vocabulary_name = "Reporting Organisation")
show_sectors(
  year = 2022, 
  ctr_name = "Brazil",
  sector_vocabulary_name = "Reporting Organisation 2")
show_sectors(
  year = c(2020, 2021, 2022),  
  ctr_name = "Brazil",
  sector_vocabulary_name = "Reporting Organisation 2")
show_sectors(
  year = c(2017,2018,2019,2020,2021, 2022), 
  ctr_name = "Brazil",
  sector_vocabulary_name = "Humanitarian Global Clusters (Inter-Agency Standing Committee)")
show_sectors(
  year = c(2017,2018,2019,2020,2021, 2022), 
  ctr_name = "Brazil",
  sector_vocabulary_name = "OECD DAC CRS Purpose Codes (5 digit)")
}
