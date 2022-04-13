

## Reference ##########
#' @title Transaction
#' @description Records of all transaction since UNHCR Programme 2016 in IATI format
#' @format A data frame with 30752 rows and 17 variables:
#' \describe{
#'   \item{\code{iati_identifier}}{character COLUMN_DESCRIPTION}
#'   \item{\code{transaction_ref}}{character COLUMN_DESCRIPTION}
#'   \item{\code{transaction_humanitarian}}{logical COLUMN_DESCRIPTION}
#'   \item{\code{transaction_type_code}}{character COLUMN_DESCRIPTION}
#'   \item{\code{transaction_date}}{character COLUMN_DESCRIPTION}
#'   \item{\code{transaction_value_currency}}{character COLUMN_DESCRIPTION}
#'   \item{\code{transaction_value_date}}{character COLUMN_DESCRIPTION}
#'   \item{\code{transaction_value}}{character COLUMN_DESCRIPTION}
#'   \item{\code{transaction_description}}{character COLUMN_DESCRIPTION}
#'   \item{\code{transaction_provider_org_type}}{character COLUMN_DESCRIPTION}
#'   \item{\code{transaction_provider_org_ref}}{character COLUMN_DESCRIPTION}
#'   \item{\code{transaction_provider_org}}{character COLUMN_DESCRIPTION}
#'   \item{\code{transaction_aid_type_code_1}}{character COLUMN_DESCRIPTION}
#'   \item{\code{transaction_aid_type_vocabulary_1}}{character COLUMN_DESCRIPTION}
#'   \item{\code{transaction_aid_type_code_2}}{character COLUMN_DESCRIPTION}
#'   \item{\code{transaction_aid_type_vocabulary_2}}{character COLUMN_DESCRIPTION}
#'   \item{\code{transaction_value_USD}}{character COLUMN_DESCRIPTION} 
#'}
#' @source \url{https://reporting.unhcr.org/iati}
"transaction"


## iati_budget ##########
#' @title Budget
#' @description DATASET_DESCRIPTION
#' @format A data frame with 840 rows and 8 variables:
#' \describe{
#'   \item{\code{iati_identifier}}{character COLUMN_DESCRIPTION}
#'   \item{\code{budget_type}}{character COLUMN_DESCRIPTION}
#'   \item{\code{budget_status}}{character COLUMN_DESCRIPTION}
#'   \item{\code{budget_period_start}}{character COLUMN_DESCRIPTION}
#'   \item{\code{budget_period_end}}{character COLUMN_DESCRIPTION}
#'   \item{\code{budget_currency}}{character COLUMN_DESCRIPTION}
#'   \item{\code{budget_value_date}}{character COLUMN_DESCRIPTION}
#'   \item{\code{budget_value}}{character COLUMN_DESCRIPTION} 
#'}
#' @source \url{https://reporting.unhcr.org/iati}
"budget"


## iati_document_link ##########
#' @title DATASET_TITLE
#' @description DATASET_DESCRIPTION
#' @format A data frame with 825 rows and 3 variables:
#' \describe{
#'   \item{\code{iati_identifier}}{character COLUMN_DESCRIPTION}
#'   \item{\code{default_aid_type_code}}{character COLUMN_DESCRIPTION}
#'   \item{\code{default_aid_type_vocabulary}}{logical COLUMN_DESCRIPTION} 
#'}
#' @source \url{https://reporting.unhcr.org/iati}
"default_aid_type"


## iati_document_link ##########
#' @title DATASET_TITLE
#' @description DATASET_DESCRIPTION
#' @format A data frame with 4722 rows and 7 variables:
#' \describe{
#'   \item{\code{iati_identifier}}{character COLUMN_DESCRIPTION}
#'   \item{\code{document_url}}{character COLUMN_DESCRIPTION}
#'   \item{\code{document_format}}{character COLUMN_DESCRIPTION}
#'   \item{\code{document_title}}{character COLUMN_DESCRIPTION}
#'   \item{\code{document_category_code}}{character COLUMN_DESCRIPTION}
#'   \item{\code{document_language_code}}{character COLUMN_DESCRIPTION}
#'   \item{\code{document_date}}{character COLUMN_DESCRIPTION} 
#'}
#' @source \url{https://reporting.unhcr.org/iati}
"document_link"


## iati_humanitarian_scope ##########
#' @title DATASET_TITLE
#' @description DATASET_DESCRIPTION
#' @format A data frame with 1578 rows and 8 variables:
#' \describe{
#'   \item{\code{iati_identifier}}{character COLUMN_DESCRIPTION}
#'   \item{\code{humanitarian_scope_type}}{character COLUMN_DESCRIPTION}
#'   \item{\code{humanitarian_scope_vocabulary}}{character COLUMN_DESCRIPTION}
#'   \item{\code{humanitarian_scope_vocabulary_uri}}{character COLUMN_DESCRIPTION}
#'   \item{\code{humanitarian_scope_code}}{character COLUMN_DESCRIPTION}
#'   \item{\code{humanitarian_scope_pct}}{logical COLUMN_DESCRIPTION}
#'   \item{\code{humanitarian_scope_desc_eng}}{character COLUMN_DESCRIPTION}
#'   \item{\code{humanitarian_scope_desc_fr}}{character COLUMN_DESCRIPTION} 
#'}
#' @source \url{https://reporting.unhcr.org/iati}
"humanitarian_scope"


## iati_location ##########
#' @title DATASET_TITLE
#' @description DATASET_DESCRIPTION
#' @format A data frame with 3664 rows and 15 variables:
#' \describe{
#'   \item{\code{iati_identifier}}{character COLUMN_DESCRIPTION}
#'   \item{\code{location_ref}}{character COLUMN_DESCRIPTION}
#'   \item{\code{location_reach}}{character COLUMN_DESCRIPTION}
#'   \item{\code{location_id_vocabulary}}{logical COLUMN_DESCRIPTION}
#'   \item{\code{location_id_code}}{logical COLUMN_DESCRIPTION}
#'   \item{\code{location_name}}{character COLUMN_DESCRIPTION}
#'   \item{\code{location_activity_descr}}{logical COLUMN_DESCRIPTION}
#'   \item{\code{location_adm_vocabulary}}{logical COLUMN_DESCRIPTION}
#'   \item{\code{location_adm_level}}{logical COLUMN_DESCRIPTION}
#'   \item{\code{location_adm_code}}{logical COLUMN_DESCRIPTION}
#'   \item{\code{location_lat}}{character COLUMN_DESCRIPTION}
#'   \item{\code{location_long}}{character COLUMN_DESCRIPTION}
#'   \item{\code{location_exactness_code}}{character COLUMN_DESCRIPTION}
#'   \item{\code{location_class_code}}{character COLUMN_DESCRIPTION}
#'   \item{\code{location_feature_designation_code}}{logical COLUMN_DESCRIPTION} 
#'}
#' @source \url{https://reporting.unhcr.org/iati}
"location"


## iati_participating_org ##########
#' @title DATASET_TITLE
#' @description DATASET_DESCRIPTION
#' @format A data frame with 13990 rows and 7 variables:
#' \describe{
#'   \item{\code{iati_identifier}}{character COLUMN_DESCRIPTION}
#'   \item{\code{participating_org_eng}}{character COLUMN_DESCRIPTION}
#'   \item{\code{participating_org_ref}}{character COLUMN_DESCRIPTION}
#'   \item{\code{participating_org_type}}{character COLUMN_DESCRIPTION}
#'   \item{\code{participating_org_role}}{character COLUMN_DESCRIPTION}
#'   \item{\code{participating_org_activity_id}}{logical COLUMN_DESCRIPTION}
#'   \item{\code{participating_org_crs_channel_code}}{logical COLUMN_DESCRIPTION} 
#'}
#' @source \url{https://reporting.unhcr.org/iati}
"participating_org"

## iati_related_activity ##########
#' @title DATASET_TITLE
#' @description DATASET_DESCRIPTION
#' @format A data frame with 2950 rows and 3 variables:
#' \describe{
#'   \item{\code{iati_identifier}}{character COLUMN_DESCRIPTION}
#'   \item{\code{related_activity_ref}}{character COLUMN_DESCRIPTION}
#'   \item{\code{related_activity_type}}{character COLUMN_DESCRIPTION} 
#'}
#' @source \url{https://reporting.unhcr.org/iati}
"related_activity"


## iati_result ##########

#' @title DATASET_TITLE
#' @description DATASET_DESCRIPTION
#' @format A data frame with 26667 rows and 24 variables:
#' \describe{
#'   \item{\code{iati_identifier}}{character COLUMN_DESCRIPTION}
#'   \item{\code{result_type}}{character COLUMN_DESCRIPTION}
#'   \item{\code{result_aggregation_status}}{character COLUMN_DESCRIPTION}
#'   \item{\code{result_title}}{character COLUMN_DESCRIPTION}
#'   \item{\code{result_desc}}{logical COLUMN_DESCRIPTION}
#'   \item{\code{result_indicator_measure}}{character COLUMN_DESCRIPTION}
#'   \item{\code{result_indicator_title}}{character COLUMN_DESCRIPTION}
#'   \item{\code{result_indicator_desc}}{character COLUMN_DESCRIPTION}
#'   \item{\code{result_indicator_baseline_value}}{character COLUMN_DESCRIPTION}
#'   \item{\code{result_indicator_baseline_year}}{character COLUMN_DESCRIPTION}
#'   \item{\code{result_indicator_baseline_date}}{logical COLUMN_DESCRIPTION}
#'   \item{\code{result_indicator_baseline_location_ref}}{character COLUMN_DESCRIPTION}
#'   \item{\code{result_indicator_baseline_dimension_1}}{character COLUMN_DESCRIPTION}
#'   \item{\code{result_indicator_baseline_dimension_value_1}}{character COLUMN_DESCRIPTION}
#'   \item{\code{result_indicator_baseline_dimension_2}}{character COLUMN_DESCRIPTION}
#'   \item{\code{result_indicator_baseline_dimension_value_2}}{character COLUMN_DESCRIPTION}
#'   \item{\code{result_indicator_period_start}}{character COLUMN_DESCRIPTION}
#'   \item{\code{result_indicator_period_end}}{character COLUMN_DESCRIPTION}
#'   \item{\code{result_indicator_target_value}}{character COLUMN_DESCRIPTION}
#'   \item{\code{result_indicator_target_location_ref}}{character COLUMN_DESCRIPTION}
#'   \item{\code{result_indicator_target_dimension_1}}{character COLUMN_DESCRIPTION}
#'   \item{\code{result_indicator_target_value_1}}{character COLUMN_DESCRIPTION}
#'   \item{\code{result_indicator_target_dimension_2}}{character COLUMN_DESCRIPTION}
#'   \item{\code{result_indicator_target_value_2}}{character COLUMN_DESCRIPTION} 
#'}
#' @source \url{https://reporting.unhcr.org/iati}
"result"


## iati_sector ##########
#' @title DATASET_TITLE
#' @description DATASET_DESCRIPTION
#' @format A data frame with 23793 rows and 6 variables:
#' \describe{
#'   \item{\code{iati_identifier}}{character COLUMN_DESCRIPTION}
#'   \item{\code{sector_vocabulary}}{character COLUMN_DESCRIPTION}
#'   \item{\code{sector_vocabulary_uri}}{logical COLUMN_DESCRIPTION}
#'   \item{\code{sector_code}}{character COLUMN_DESCRIPTION}
#'   \item{\code{sector_pct}}{character COLUMN_DESCRIPTION}
#'   \item{\code{sector_desc}}{character COLUMN_DESCRIPTION} 
#'}
#' @source \url{https://reporting.unhcr.org/iati}
"sector"

## iati_transaction ##########
#' @title DATASET_TITLE
#' @description DATASET_DESCRIPTION
#' @format A data frame with 30752 rows and 17 variables:
#' \describe{
#'   \item{\code{iati_identifier}}{character COLUMN_DESCRIPTION}
#'   \item{\code{transaction_ref}}{character COLUMN_DESCRIPTION}
#'   \item{\code{transaction_humanitarian}}{logical COLUMN_DESCRIPTION}
#'   \item{\code{transaction_type_code}}{character COLUMN_DESCRIPTION}
#'   \item{\code{transaction_date}}{character COLUMN_DESCRIPTION}
#'   \item{\code{transaction_value_currency}}{character COLUMN_DESCRIPTION}
#'   \item{\code{transaction_value_date}}{character COLUMN_DESCRIPTION}
#'   \item{\code{transaction_value}}{character COLUMN_DESCRIPTION}
#'   \item{\code{transaction_description}}{character COLUMN_DESCRIPTION}
#'   \item{\code{transaction_provider_org_type}}{character COLUMN_DESCRIPTION}
#'   \item{\code{transaction_provider_org_ref}}{character COLUMN_DESCRIPTION}
#'   \item{\code{transaction_provider_org}}{character COLUMN_DESCRIPTION}
#'   \item{\code{transaction_aid_type_code_1}}{character COLUMN_DESCRIPTION}
#'   \item{\code{transaction_aid_type_vocabulary_1}}{character COLUMN_DESCRIPTION}
#'   \item{\code{transaction_aid_type_code_2}}{character COLUMN_DESCRIPTION}
#'   \item{\code{transaction_aid_type_vocabulary_2}}{character COLUMN_DESCRIPTION}
#'   \item{\code{transaction_value_USD}}{character COLUMN_DESCRIPTION} 
#'}
#' @source \url{https://reporting.unhcr.org/iati}
"transaction"