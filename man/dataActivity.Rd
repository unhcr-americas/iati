% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{dataActivity}
\alias{dataActivity}
\title{dataActivity}
\format{
A data frame with 825 rows and 45 variables:
\describe{
  \item{\code{iati_identifier}}{character A globally unique identifier for the activity.}
  \item{\code{reporting_org}}{character The organisation issuing the report. May be a primary source (reporting on its own activity as donor, implementing agency, etc) or a secondary source (reporting on the activities of another organisation).}
  \item{\code{reporting_org_ref}}{character Machine-readable identification string for the organisation issuing the report. Must be in the format {RegistrationAgency}-{RegistrationNumber} where {RegistrationAgency} is a valid code in the Organisation Registration Agency code list and {RegistrationNumber} is a valid identifier issued by the {RegistrationAgency}.}
  \item{\code{reporting_org_type}}{character The type of organisation issuing the report. See IATI codelist for values.}
  \item{\code{reporting_org_secondary_reporter}}{logical A flag indicating that the reporting organisation of this activity is acting as a secondary reporter. A secondary reporter is one that reproduces data on the activities of an organisation for which it is not directly responsible. This does not include a publisher officially assigned as a proxy to report on behalf of another.}
  \item{\code{title_eng}}{character A short, human-readable title that contains a meaningful summary of the activity. English}
  \item{\code{title_fr}}{character A short, human-readable title that contains a meaningful summary of the activity. French}
  \item{\code{title_es}}{character A short, human-readable title that contains a meaningful summary of the activity. Spanish}
  \item{\code{title_zh}}{character A short, human-readable title that contains a meaningful summary of the activity. Chinese}
  \item{\code{title_ru}}{character A short, human-readable title that contains a meaningful summary of the activity. Russian}
  \item{\code{title_ar}}{character A short, human-readable title that contains a meaningful summary of the activity. Arabic}
  \item{\code{description_type_1}}{character The type of description being provided. This is not required if only one general description of the activity is reported.}
  \item{\code{description_eng_1}}{character Description type 1 - English}
  \item{\code{descriptionv_fr_1}}{character Description type 1 - French}
  \item{\code{description_type_2}}{character COLUMN_DESCRIPTION}
  \item{\code{description_eng_2}}{character COLUMN_DESCRIPTION}
  \item{\code{descriptionv_fr_2}}{character COLUMN_DESCRIPTION}
  \item{\code{activity_status_code}}{double COLUMN_DESCRIPTION}
  \item{\code{activity_date_1}}{date COLUMN_DESCRIPTION}
  \item{\code{activity_date_type_1}}{double COLUMN_DESCRIPTION}
  \item{\code{activity_date_2}}{date COLUMN_DESCRIPTION}
  \item{\code{activity_date_type_2}}{double COLUMN_DESCRIPTION}
  \item{\code{activity_date_3}}{date COLUMN_DESCRIPTION}
  \item{\code{activity_date_type_3}}{double COLUMN_DESCRIPTION}
  \item{\code{activity_date_4}}{date COLUMN_DESCRIPTION}
  \item{\code{activity_date_type_4}}{double COLUMN_DESCRIPTION}
  \item{\code{contact_info_type}}{character COLUMN_DESCRIPTION}
  \item{\code{contact_info_org}}{character COLUMN_DESCRIPTION}
  \item{\code{contact_info_email}}{character COLUMN_DESCRIPTION}
  \item{\code{contact_info_website}}{character COLUMN_DESCRIPTION}
  \item{\code{contact_info_mailing_address}}{character COLUMN_DESCRIPTION}
  \item{\code{activity_scope_code}}{double COLUMN_DESCRIPTION}
  \item{\code{recipient_country_code}}{character COLUMN_DESCRIPTION}
  \item{\code{recipient_country_pct}}{logical COLUMN_DESCRIPTION}
  \item{\code{recipient_country}}{logical COLUMN_DESCRIPTION}
  \item{\code{recipient_region_code}}{double COLUMN_DESCRIPTION}
  \item{\code{recipient_region_vocabulary}}{double COLUMN_DESCRIPTION}
  \item{\code{recipient_region_vocabulary_url}}{character COLUMN_DESCRIPTION}
  \item{\code{recipient_region_pct}}{logical COLUMN_DESCRIPTION}
  \item{\code{recipient_region}}{character COLUMN_DESCRIPTION}
  \item{\code{collaboration_type_code}}{double The type of collaboration involved in the activity’s disbursements, e.g. “bilateral” or “multilateral”.}
  \item{\code{default_flow_type_code}}{double COLUMN_DESCRIPTION}
  \item{\code{default_finance_type_code}}{double COLUMN_DESCRIPTION}
  \item{\code{default_tied_status_code}}{double COLUMN_DESCRIPTION}
  \item{\code{capital_spend}}{double COLUMN_DESCRIPTION} 
}
}
\source{
\url{https://iatistandard.org/en/iati-standard/203/activity-standard/iati-activities/iati-activity/}
}
\usage{
dataActivity
}
\description{
Records of all activities since UNHCR Programme 2016 in IATI format
}
\examples{
{
knitr::kable(head(dataActivity, 10))
}
}
\keyword{datasets}
