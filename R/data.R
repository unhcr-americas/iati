


#### Data Table ###############

## iati_activity ##########
#' @title dataActivity
#' @description Records of all activities since UNHCR Programme 2016 in IATI format
#' @format A data frame with 825 rows and 45 variables:
#' \describe{
#'   \item{\code{iati_identifier}}{character A globally unique identifier for the activity.}
#'   \item{\code{reporting_org}}{character The organisation issuing the report. May be a primary source (reporting on its own activity as donor, implementing agency, etc) or a secondary source (reporting on the activities of another organisation).}
#'   \item{\code{reporting_org_ref}}{character Machine-readable identification string for the organisation issuing the report. Must be in the format {RegistrationAgency}-{RegistrationNumber} where {RegistrationAgency} is a valid code in the Organisation Registration Agency code list and {RegistrationNumber} is a valid identifier issued by the {RegistrationAgency}.}
#'   \item{\code{reporting_org_type}}{character The type of organisation issuing the report. See IATI codelist for values.}
#'   \item{\code{reporting_org_secondary_reporter}}{logical A flag indicating that the reporting organisation of this activity is acting as a secondary reporter. A secondary reporter is one that reproduces data on the activities of an organisation for which it is not directly responsible. This does not include a publisher officially assigned as a proxy to report on behalf of another.}
#'   \item{\code{title_eng}}{character A short, human-readable title that contains a meaningful summary of the activity. English}
#'   \item{\code{title_fr}}{character A short, human-readable title that contains a meaningful summary of the activity. French}
#'   \item{\code{title_es}}{character A short, human-readable title that contains a meaningful summary of the activity. Spanish}
#'   \item{\code{title_zh}}{character A short, human-readable title that contains a meaningful summary of the activity. Chinese}
#'   \item{\code{title_ru}}{character A short, human-readable title that contains a meaningful summary of the activity. Russian}
#'   \item{\code{title_ar}}{character A short, human-readable title that contains a meaningful summary of the activity. Arabic}
#'   \item{\code{description_type_1}}{character The type of description being provided. This is not required if only one general description of the activity is reported.}
#'   \item{\code{description_eng_1}}{character Description type 1 - English}
#'   \item{\code{descriptionv_fr_1}}{character Description type 1 - French}
#'   \item{\code{description_type_2}}{character COLUMN_DESCRIPTION}
#'   \item{\code{description_eng_2}}{character COLUMN_DESCRIPTION}
#'   \item{\code{descriptionv_fr_2}}{character COLUMN_DESCRIPTION}
#'   \item{\code{activity_status_code}}{double COLUMN_DESCRIPTION}
#'   \item{\code{activity_date_1}}{date COLUMN_DESCRIPTION}
#'   \item{\code{activity_date_type_1}}{double COLUMN_DESCRIPTION}
#'   \item{\code{activity_date_2}}{date COLUMN_DESCRIPTION}
#'   \item{\code{activity_date_type_2}}{double COLUMN_DESCRIPTION}
#'   \item{\code{activity_date_3}}{date COLUMN_DESCRIPTION}
#'   \item{\code{activity_date_type_3}}{double COLUMN_DESCRIPTION}
#'   \item{\code{activity_date_4}}{date COLUMN_DESCRIPTION}
#'   \item{\code{activity_date_type_4}}{double COLUMN_DESCRIPTION}
#'   \item{\code{contact_info_type}}{character COLUMN_DESCRIPTION}
#'   \item{\code{contact_info_org}}{character COLUMN_DESCRIPTION}
#'   \item{\code{contact_info_email}}{character COLUMN_DESCRIPTION}
#'   \item{\code{contact_info_website}}{character COLUMN_DESCRIPTION}
#'   \item{\code{contact_info_mailing_address}}{character COLUMN_DESCRIPTION}
#'   \item{\code{activity_scope_code}}{double activity_scope_code}
#'   \item{\code{recipient_country_code}}{character recipient_country_code alpha 2 letters}
#'   \item{\code{recipient_country_pct}}{logical percentage of this activity to the recipoent country}
#'   \item{\code{recipient_country}}{logical COLUMN_DESCRIPTION}
#'   \item{\code{recipient_region_code}}{double COLUMN_DESCRIPTION}
#'   \item{\code{recipient_region_vocabulary}}{double COLUMN_DESCRIPTION}
#'   \item{\code{recipient_region_vocabulary_url}}{character COLUMN_DESCRIPTION}
#'   \item{\code{recipient_region_pct}}{logical COLUMN_DESCRIPTION}
#'   \item{\code{recipient_region}}{character recipient_region}
#'   \item{\code{collaboration_type_code}}{double The type of collaboration involved in the activity’s disbursements, e.g. “bilateral” or “multilateral”.}
#'   \item{\code{default_flow_type_code}}{double COLUMN_DESCRIPTION}
#'   \item{\code{default_finance_type_code}}{double COLUMN_DESCRIPTION}
#'   \item{\code{default_tied_status_code}}{double COLUMN_DESCRIPTION}
#'   \item{\code{capital_spend}}{double capital_spend} 
#'   \item{\code{year}}{character iati id year}
#'   \item{\code{iati_identifier_reg_ops}}{character iati_identifier_reg_ops}
#'   \item{\code{is_operation}}{logical is a UNHCR Field Operation}
#'   \item{\code{programmme}}{character ID of the programme or region}
#'   \item{\code{programmme_lab}}{character label of the programme or region}
#'   \item{\code{iati_identifier_ops}}{character Operation identifier}
#'   \item{\code{iso3c}}{character iso 3 character for the country}
#'   \item{\code{ops_type}}{character type of operation if not single country operation}
#'   \item{\code{ctr_name}}{character countyr name}
#'   \item{\code{unhcr_region}}{character unhcr region}
#'   \item{\code{reporting_org_type_name}}{character reporting_org_type_name}
#'   \item{\code{reporting_org_type_description}}{character reporting_org_type_description}
#'   \item{\code{activity_status_name}}{character activity_status_name}
#'   \item{\code{activity_status_description}}{character activity_status_description}
#'   \item{\code{activity_scope_name}}{character activity_scope_name}
#'   \item{\code{activity_scope_description}}{character activity_scope_description} 
#'   \item{\code{collaboration_type_name}}{character collaboration_type_name}
#'   \item{\code{collaboration_type_description}}{character collaboration_type_description} 
#'}
#' @source \url{https://iatistandard.org/en/iati-standard/203/activity-standard/iati-activities/iati-activity/}
#' @examples
#' {
#' knitr::kable(head(dataActivity, 10))
#'}
"dataActivity"


## iati_budget ##########
#' @title dataBudget
#' @description Display budget by operation
#' @format A data frame with 1194 rows and 8 variables:
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
#' @source \url{https://iatistandard.org/en/iati-standard/203/}
#' @examples
#' {
#' knitr::kable(head(dataBudget, 10))
#'}
"dataBudget"



## iati_result ##########

#' @title dataResult
#' @description DATASET_DESCRIPTION
#' @format A data frame with 26667 rows and 24 variables:
#' \describe{
#'   \item{\code{iati_identifier}}{character A globally unique identifier for the activity.}
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
#' @source \url{https://iatistandard.org/en/iati-standard/203/}
#' @examples
#' {
#' knitr::kable(head(dataResult, 10))
#'}
"dataResult"


## iati_sector ##########
#' @title sector
#' @description DATASET_DESCRIPTION
#' @format A data frame with 23793 rows and 6 variables:
#' \describe{
#'   \item{\code{iati_identifier}}{character A globally unique identifier for the activity.}
#'   \item{\code{sector_vocabulary}}{character COLUMN_DESCRIPTION}
#'   \item{\code{sector_vocabulary_uri}}{logical COLUMN_DESCRIPTION}
#'   \item{\code{sector_code}}{character COLUMN_DESCRIPTION}
#'   \item{\code{sector_pct}}{character COLUMN_DESCRIPTION}
#'   \item{\code{sector_desc}}{character COLUMN_DESCRIPTION} 
#'}
#' @source \url{https://iatistandard.org/en/iati-standard/203/}
#' @examples
#' {
#' knitr::kable(head(dataSector, 10))
#'}
"dataSector"

## iati_transaction ##########
#' @title transaction
#' @description Transactions recording committed or actual funds flowing in or out of an aid activity.
#' @format A data frame with 40419 rows and 29 variables:
#' \describe{
#'   \item{\code{iati_identifier}}{character COLUMN_DESCRIPTION}
#'   \item{\code{transaction_ref}}{character COLUMN_DESCRIPTION}
#'   \item{\code{transaction_humanitarian}}{logical COLUMN_DESCRIPTION}
#'   \item{\code{transaction_type_code}}{double COLUMN_DESCRIPTION}
#'   \item{\code{transaction_date}}{double COLUMN_DESCRIPTION}
#'   \item{\code{transaction_value_currency}}{character COLUMN_DESCRIPTION}
#'   \item{\code{transaction_value_date}}{double COLUMN_DESCRIPTION}
#'   \item{\code{transaction_value}}{double COLUMN_DESCRIPTION}
#'   \item{\code{transaction_description}}{character COLUMN_DESCRIPTION}
#'   \item{\code{transaction_provider_org_type}}{double COLUMN_DESCRIPTION}
#'   \item{\code{transaction_provider_org_ref}}{character COLUMN_DESCRIPTION}
#'   \item{\code{transaction_provider_org}}{character COLUMN_DESCRIPTION}
#'   \item{\code{transaction_aid_type_code_1}}{character COLUMN_DESCRIPTION}
#'   \item{\code{transaction_aid_type_vocabulary_1}}{double COLUMN_DESCRIPTION}
#'   \item{\code{transaction_aid_type_code_2}}{character COLUMN_DESCRIPTION}
#'   \item{\code{transaction_aid_type_vocabulary_2}}{double COLUMN_DESCRIPTION}
#'   \item{\code{transaction_value_USD}}{double COLUMN_DESCRIPTION}
#'   \item{\code{transaction_type_name}}{character COLUMN_DESCRIPTION}
#'   \item{\code{transaction_type_description}}{character COLUMN_DESCRIPTION}
#'   \item{\code{provider_org_type_name}}{character COLUMN_DESCRIPTION}
#'   \item{\code{provider_org_type_description}}{character COLUMN_DESCRIPTION}
#'   \item{\code{aid_type1_name}}{character COLUMN_DESCRIPTION}
#'   \item{\code{aid_type1_description}}{character COLUMN_DESCRIPTION}
#'   \item{\code{aid_type2_name}}{character COLUMN_DESCRIPTION}
#'   \item{\code{aid_type2_description}}{character COLUMN_DESCRIPTION}
#'   \item{\code{aid_type_vocabulary1_name}}{character COLUMN_DESCRIPTION}
#'   \item{\code{aid_type_vocabulary1_description}}{character COLUMN_DESCRIPTION}
#'   \item{\code{aid_type_vocabulary2_name}}{character COLUMN_DESCRIPTION}
#'   \item{\code{aid_type_vocabulary2_description}}{character COLUMN_DESCRIPTION} 
#'}
#' @source \url{https://iatistandard.org/en/iati-standard/203/activity-standard/iati-activities/iati-activity/transaction/}
#' @examples
#' {
#' knitr::kable(head(dataTransaction, 10))
#'}
"dataTransaction"




## iati_default_aid_type ##########
#' @title dataDefault_aid_type
#' @description Default_aid_type 
#' @format A data frame with 825 rows and 3 variables:
#' \describe{
#'   \item{\code{iati_identifier}}{character A globally unique identifier for the activity.}
#'   \item{\code{default_aid_type_code}}{character aid_type_code}
#'   \item{\code{default_aid_type_vocabulary}}{logical aid_type_vocabulary} 
#'}
#' @source \url{https://iatistandard.org/en/iati-standard/203/}
#' @examples
#' {
#' knitr::kable(head(dataDefault_aid_type, 10))
#'}
"dataDefault_aid_type"


## iati_document_link ##########
#' @title dataDocument_link
#' @description Links to additional documents in relation with the programme
#' @format A data frame with 4722 rows and 7 variables:
#' \describe{
#'   \item{\code{iati_identifier}}{character A globally unique identifier for the activity.}
#'   \item{\code{document_url}}{character document_url}
#'   \item{\code{document_format}}{character COLUMN_DESCRIPTION}
#'   \item{\code{document_title}}{character COLUMN_DESCRIPTION}
#'   \item{\code{document_category_code}}{character COLUMN_DESCRIPTION}
#'   \item{\code{document_language_code}}{character COLUMN_DESCRIPTION}
#'   \item{\code{document_date}}{character COLUMN_DESCRIPTION} 
#'}
#' @source \url{https://iatistandard.org/en/iati-standard/203/}
#' @examples
#' {
#' knitr::kable(head(dataDocument_link, 10))
#'}
"dataDocument_link"


## iati_humanitarian_scope ##########
#' @title dataHumanitarian_scope
#' @description DATASET_DESCRIPTION
#' @format A data frame with 1578 rows and 8 variables:
#' \describe{
#'   \item{\code{iati_identifier}}{character A globally unique identifier for the activity.}
#'   \item{\code{humanitarian_scope_type}}{character COLUMN_DESCRIPTION}
#'   \item{\code{humanitarian_scope_vocabulary}}{character COLUMN_DESCRIPTION}
#'   \item{\code{humanitarian_scope_vocabulary_uri}}{character COLUMN_DESCRIPTION}
#'   \item{\code{humanitarian_scope_code}}{character COLUMN_DESCRIPTION}
#'   \item{\code{humanitarian_scope_pct}}{logical COLUMN_DESCRIPTION}
#'   \item{\code{humanitarian_scope_desc_eng}}{character COLUMN_DESCRIPTION}
#'   \item{\code{humanitarian_scope_desc_fr}}{character COLUMN_DESCRIPTION} 
#'}
#' @source \url{https://iatistandard.org/en/iati-standard/203/}
#' @examples
#' {
#' knitr::kable(head(dataHumanitarian_scope, 10))
#'}
"dataHumanitarian_scope"


## iati_location ##########
#' @title dataLocation 
#' @description DATASET_DESCRIPTION
#' @format A data frame with 3664 rows and 15 variables:
#' \describe{
#'   \item{\code{iati_identifier}}{character A globally unique identifier for the activity.}
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
#' @source \url{https://iatistandard.org/en/iati-standard/203/}
#' @examples
#' {
#' knitr::kable(head(dataLocation, 10))
#'}
"dataLocation"


## iati_participating_org ##########
#' @title participating_org
#' @description An organisation involved with the activity. May be a donor, fund, agency, etc.
#'  Specifying the ref identifier is strongly recommended. May contain the organisation name as narrative. 
#' If the reporting organisation plays a role in the activity it should be repeated here. One organisation may play more than one role (eg, funding and implementing): in such a case each role should be reported and the name of the organisation repeated.
#' @format A data frame with 13990 rows and 7 variables:
#' \describe{
#'   \item{\code{iati_identifier}}{character A globally unique identifier for the activity.}
#'   \item{\code{participating_org_eng}}{character COLUMN_DESCRIPTION}
#'   \item{\code{participating_org_ref}}{character Machine-readable identification string for the organisation issuing the report. Must be in the format {RegistrationAgency}-{RegistrationNumber} where {RegistrationAgency} is a valid code in the Organisation Registration Agency code list and {RegistrationNumber} is a valid identifier issued by the {RegistrationAgency}. If this is not present then the narrative MUST contain the name of the organisation.}
#'   \item{\code{participating_org_type}}{double The type of organisation issuing the report. See IATI codelist codeOrganisationType for values.}
#'   \item{\code{participating_org_role}}{double An IATI code describing the organisation’s role in the activity (donor, agency, etc.). see codeOrganisationRole}
#'   \item{\code{participating_org_activity_id}}{logical A valid activity identifier published by the participating organisation which points to the activity that it has published to IATI that describes its role in this activity.}
#'   \item{\code{participating_org_crs_channel_code}}{logical Under CRS++ Reporting Directives this code identifies the implementing agency. Codes ending in ‘00’ are generic and are similar to the OrganisationType code.} 
#'}
#' @source \url{https://iatistandard.org/en/iati-standard/203/}
#' @examples
#' {
#' knitr::kable(head(dataParticipating_org, 10))
#'}
"dataParticipating_org"

## iati_related_activity ##########
#' @title dataRelated_activity
#' @description DATASET_DESCRIPTION
#' @format A data frame with 2950 rows and 3 variables:
#' \describe{
#'   \item{\code{iati_identifier}}{character A globally unique identifier for the activity.}
#'   \item{\code{related_activity_ref}}{character COLUMN_DESCRIPTION}
#'   \item{\code{related_activity_type}}{character COLUMN_DESCRIPTION} 
#'}
#' @source \url{https://iatistandard.org/en/iati-standard/203/}
#' @examples
#' {
#' knitr::kable(head(dataRelated_activity, 10))
#'}
"dataRelated_activity"




#### All code list doc ############

 



#' @title codeCollaborationType
#' @description OECD DAC classification used to determine the character of
#'     resource flows (bilateral or multilateral).
#'   External URL: http://www.oecd.org/dac/stats/dacandcrscodelists.htm
#' @format A data frame with 7 rows and 6 variables:
#' \describe{
#'   \item{\code{code}}{double code}
#'   \item{\code{name}}{character name}
#'   \item{\code{description}}{character description}
#'   \item{\code{category}}{double  category}
#'   \item{\code{url}}{character url}
#'   \item{\code{status}}{character status}
#'}
#' @source \url{https://iatistandard.org/en/iati-standard/203/codelists/collaborationtype/}
#' @examples
#' {
#' knitr::kable(head(codeCollaborationType, 10))
#'}
"codeCollaborationType"



#' @title codeActivityDateType
#' @description Types of date for activities.
#' There are many different business models and dates that can be used to describe
#'  the start and end of activities. It is recommended that each publisher
#'  adopts their own consistent approach that provides users with a meaningful
#'  indication of the lifespan of an activity.
#' @format A data frame with 4 rows and 6 variables:
#' \describe{
#'   \item{\code{code}}{double code}
#'   \item{\code{name}}{character name}
#'   \item{\code{description}}{character description}
#'   \item{\code{category}}{double  category}
#'   \item{\code{url}}{character url}
#'   \item{\code{status}}{character status}
#'}
#' @source \url{https://iatistandard.org/en/iati-standard/203/codelists/}
#' @examples
#' {
#' knitr::kable(head(codeActivityDateType, 10))
#'}
"codeActivityDateType"


#' @title codeActivityScope
#' @description Geographic scope of activity
#' @format A data frame with 8 rows and 6 variables:
#' \describe{
#'   \item{\code{code}}{double code}
#'   \item{\code{name}}{character name}
#'   \item{\code{description}}{character description}
#'   \item{\code{category}}{double  category}
#'   \item{\code{url}}{character url}
#'   \item{\code{status}}{character status}
#'}
#' @source \url{https://iatistandard.org/en/iati-standard/203/codelists/}
#' @examples
#' {
#' knitr::kable(head(codeActivityScope, 10))
#'}
"codeActivityScope"


#' @title codeActivityStatus
#' @description Lifecycle status of the activity from pipeline to completion
#' @format A data frame with 6 rows and 6 variables:
#' \describe{
#'   \item{\code{code}}{double code}
#'   \item{\code{name}}{character name}
#'   \item{\code{description}}{character description}
#'   \item{\code{category}}{double  category}
#'   \item{\code{url}}{character url}
#'   \item{\code{status}}{character status}
#'}
#' @source \url{https://iatistandard.org/en/iati-standard/203/codelists/}
#' @examples
#' {
#' knitr::kable(head(codeActivityStatus, 10))
#'}
"codeActivityStatus"


#' @title codeAidType
#' @description See: http://www.oecd.org/dac/stats/dacandcrscodelists.htm
#' @format A data frame with 18 rows and 6 variables:
#' \describe{
#'   \item{\code{code}}{double code}
#'   \item{\code{name}}{character name}
#'   \item{\code{description}}{character description}
#'   \item{\code{category}}{double  category}
#'   \item{\code{url}}{character url}
#'   \item{\code{status}}{character status}
#'}
#' @source \url{https://iatistandard.org/en/iati-standard/203/codelists/}
#' @examples
#' {
#' knitr::kable(head(codeAidType, 10))
#'}
"codeAidType"

#' @title codeAidTypeCategory
#' @description This codelists exists to group the Aid Type codelist into
#' categories. It is not used as a codelist in its own right.
#' External URL: http://www.oecd.org/dac/stats/dacandcrscodelists.htm
#' @format A data frame with 8 rows and 6 variables:
#' \describe{
#'   \item{\code{code}}{double code}
#'   \item{\code{name}}{character name}
#'   \item{\code{description}}{character description}
#'   \item{\code{category}}{double  category}
#'   \item{\code{url}}{character url}
#'   \item{\code{status}}{character status}
#'}
#' @source \url{https://iatistandard.org/en/iati-standard/203/codelists/}
#' @examples
#' {
#' knitr::kable(head(codeAidTypeCategory, 10))
#'}
"codeAidTypeCategory"

#' @title codeAidTypeVocabulary
#' @description The AidTypeVocabulary codelist defines a range of external
#' codelists which themselves provide codes and descriptions for aid type.
#' This is a Non-Core codelist.
#' @format A data frame with 4 rows and 6 variables:
#' \describe{
#'   \item{\code{code}}{double code}
#'   \item{\code{name}}{character name}
#'   \item{\code{description}}{character description}
#'   \item{\code{category}}{double  category}
#'   \item{\code{url}}{character url}
#'   \item{\code{status}}{character status}
#'}
#' @source \url{https://iatistandard.org/en/iati-standard/203/codelists/}
#' @examples
#' {
#' knitr::kable(head(codeAidTypeVocabulary, 10))
#'}
"codeAidTypeVocabulary"


#' @title codeBudgetIdentifier
#' @description IATI Functional and Administrative Common Code :
#' One of several possible Budget Identifier Vocabularies.
#' As of version 2.03 this codelist has been deprecated.
#'   This is a Non-Core codelist.
#' @format A data frame with 152 rows and 6 variables:
#' \describe{
#'   \item{\code{code}}{double code}
#'   \item{\code{name}}{character name}
#'   \item{\code{description}}{character description}
#'   \item{\code{category}}{double  category}
#'   \item{\code{url}}{character url}
#'   \item{\code{status}}{character status}
#'}
#' @source \url{https://iatistandard.org/en/iati-standard/203/codelists/}
#' @examples
#' {
#' knitr::kable(head(codeBudgetIdentifier, 10))
#'}
"codeBudgetIdentifier"


#' @title codeBudgetIdentifierSector
#' @description This codelists exists to group the Budget Identifier codelist
#' into sectors. It is not used as a codelist in its own right.
#'   This is a Non-Core codelist.
#' @format A data frame with 31 rows and 6 variables:
#' \describe{
#'   \item{\code{code}}{double code}
#'   \item{\code{name}}{character name}
#'   \item{\code{description}}{character description}
#'   \item{\code{category}}{double  category}
#'   \item{\code{url}}{character url}
#'   \item{\code{status}}{character status}
#'}
#' @source \url{https://iatistandard.org/en/iati-standard/203/codelists/}
#' @examples
#' {
#' knitr::kable(head(codeBudgetIdentifierSector, 10))
#'}
"codeBudgetIdentifierSector"

#' @title codeSectorCategory
#' @description DAC 3 Digit Sector
#'   External URL: http://www.oecd.org/dac/stats/dacandcrscodelists.htm
#' @format A data frame with 44 rows and 6 variables:
#' \describe{
#'   \item{\code{code}}{double code}
#'   \item{\code{name}}{character name}
#'   \item{\code{description}}{character description}
#'   \item{\code{category}}{double  category}
#'   \item{\code{url}}{character url}
#'   \item{\code{status}}{character status}
#'}
#' @source \url{https://iatistandard.org/en/iati-standard/203/codelists/}
#' @examples
#' {
#' knitr::kable(head(codeSectorCategory, 10))
#'}
"codeSectorCategory"

#' @title codeSector
#' @description DAC 5 Digit Sector
#'   External URL: http://www.oecd.org/dac/stats/dacandcrscodelists.htm
#' @format A data frame with 323 rows and 6 variables:
#' \describe{
#'   \item{\code{code}}{double code}
#'   \item{\code{name}}{character name}
#'   \item{\code{description}}{character description}
#'   \item{\code{category}}{double  category}
#'   \item{\code{url}}{character url}
#'   \item{\code{status}}{character status}
#'}
#' @source \url{https://iatistandard.org/en/iati-standard/203/codelists/}
#' @examples
#' {
#' knitr::kable(head(codeSector, 10))
#'}
"codeSector"


#' @title codeCashandVoucherModalities
#' @description This codelist has been created by IATI following agreements
#' and recommendations of the Tracking Cash and Voucher Assistance (CVA)
#' Working Group. Definitions of the codes have been aligned with the
#' CaLP Glossary:http://www.cashlearning.org/resources/glossary.
#'   This is a Non-Core codelist.
#' @format A data frame with 2 rows and 6 variables:
#' \describe{
#'   \item{\code{code}}{double code}
#'   \item{\code{name}}{character name}
#'   \item{\code{description}}{character description}
#'   \item{\code{category}}{double  category}
#'   \item{\code{url}}{character url}
#'   \item{\code{status}}{character status}
#'}
#' @source \url{https://iatistandard.org/en/iati-standard/203/codelists/}
#' @examples
#' {
#' knitr::kable(head(codeCashandVoucherModalities, 10))
#'}
"codeCashandVoucherModalities"


#' @title codeCountry
#' @description The Country codelist is generated from the ISO 3166-1 part
#'  of the ISO 3166 standard. The standard makes allowance, alongside
#'   the officially assigned codes, for code elements to be expanded by using
#'   either reserved codes or user-assigned codes.
#'   IATI currently defines additional codes in the XA -XZ range.
#'     External URL: http://www.iso.org/iso/home/standards/country_codes.htm
#' @format A data frame with 251 rows and 6 variables:
#' \describe{
#'   \item{\code{code}}{double code}
#'   \item{\code{name}}{character name}
#'   \item{\code{description}}{character description}
#'   \item{\code{category}}{double  category}
#'   \item{\code{url}}{character url}
#'   \item{\code{status}}{character status}
#'}
#' @source \url{https://iatistandard.org/en/iati-standard/203/codelists/}
#' @examples
#' {
#' knitr::kable(head(codeCountry, 10))
#'}
"codeCountry"

#' @title codeRegion
#' @description External URL: http://www.oecd.org/dac/stats/dacandcrscodelists.htm
#' @format A data frame with 26 rows and 6 variables:
#' \describe{
#'   \item{\code{code}}{double code}
#'   \item{\code{name}}{character name}
#'   \item{\code{description}}{character description}
#'   \item{\code{category}}{double  category}
#'   \item{\code{url}}{character url}
#'   \item{\code{status}}{character status}
#'}
#' @source \url{https://iatistandard.org/en/iati-standard/203/codelists/}
#' @examples
#' {
#' knitr::kable(head(codeRegion, 10))
#'}
"codeRegion"


#' @title codeCurrency
#' @description ISO 4217 Currency used for all transactions and budgets
#'   External URL: http://www.iso.org/iso/home/standards/currency_codes.htm
#' @format A data frame with 174 rows and 6 variables:
#' \describe{
#'   \item{\code{code}}{double code}
#'   \item{\code{name}}{character name}
#'   \item{\code{description}}{character description}
#'   \item{\code{category}}{double  category}
#'   \item{\code{url}}{character url}
#'   \item{\code{status}}{character status}
#'}
#' @source \url{https://iatistandard.org/en/iati-standard/203/codelists/}
#' @examples
#' {
#' knitr::kable(head(codeCurrency, 10))
#'}
"codeCurrency"

#' @title codeDescriptionType
#' @description Activity decription types. (General, objectives, etc)
#' @format A data frame with 4 rows and 6 variables:
#' \describe{
#'   \item{\code{code}}{double code}
#'   \item{\code{name}}{character name}
#'   \item{\code{description}}{character description}
#'   \item{\code{category}}{double  category}
#'   \item{\code{url}}{character url}
#'   \item{\code{status}}{character status}
#'}
#' @source \url{https://iatistandard.org/en/iati-standard/203/codelists/}
#' @examples
#' {
#' knitr::kable(head(codeDescriptionType, 10))
#'}
"codeDescriptionType"

#' @title codeEarmarkingCategory
#' @description This codelist has been created by IATI and is derived from the
#' Grand Bargain Earmarking Modality codelist.
#' See: https://reliefweb.int/sites/reliefweb.int/files/resources/Grand_Bargain_final_22_May_FINAL-2.pdf
#' @format A data frame with 4 rows and 6 variables:
#' \describe{
#'   \item{\code{code}}{double code}
#'   \item{\code{name}}{character name}
#'   \item{\code{description}}{character description}
#'   \item{\code{category}}{double  category}
#'   \item{\code{url}}{character url}
#'   \item{\code{status}}{character status}
#'}
#' @source \url{https://iatistandard.org/en/iati-standard/203/codelists/}
#' @examples
#' {
#' knitr::kable(head(codeEarmarkingCategory, 10))
#'}
"codeEarmarkingCategory"


#' @title codeFlowType
#' @description DAC/CRS distinction between ODA (official development assistance)
#'  and other types of resource flow.
#'    External URL: http://www.oecd.org/dac/stats/dacandcrscodelists.htm
#' @format A data frame with 10 rows and 6 variables:
#' \describe{
#'   \item{\code{code}}{double code}
#'   \item{\code{name}}{character name}
#'   \item{\code{description}}{character description}
#'   \item{\code{category}}{double  category}
#'   \item{\code{url}}{character url}
#'   \item{\code{status}}{character status}
#'}
#' @source \url{https://iatistandard.org/en/iati-standard/203/codelists/}
#' @examples
#' {
#' knitr::kable(head(codeFlowType, 10))
#'}
"codeFlowType"


#' @title codeGeographicLocationClass
#' @description This is a Non-Core codelist.
#' @format A data frame with 4 rows and 6 variables:
#' \describe{
#'   \item{\code{code}}{double code}
#'   \item{\code{name}}{character name}
#'   \item{\code{description}}{character description}
#'   \item{\code{category}}{double  category}
#'   \item{\code{url}}{character url}
#'   \item{\code{status}}{character status}
#'}
#' @source \url{https://iatistandard.org/en/iati-standard/203/codelists/}
#' @examples
#' {
#' knitr::kable(head(codeGeographicLocationClass, 10))
#'}
"codeGeographicLocationClass"


#' @title codeHumanitarianScopeType
#' @description The Humanitarian Scope Type codelist defines codes for types of
#' humanitarian events and actions.
#' @format A data frame with 2 rows and 6 variables:
#' \describe{
#'   \item{\code{code}}{double code}
#'   \item{\code{name}}{character name}
#'   \item{\code{description}}{character description}
#'   \item{\code{category}}{double  category}
#'   \item{\code{url}}{character url}
#'   \item{\code{status}}{character status}
#'}
#' @source \url{https://iatistandard.org/en/iati-standard/203/codelists/}
#' @examples
#' {
#' knitr::kable(head(codeHumanitarianScopeType, 10))
#'}
"codeHumanitarianScopeType"


#' @title codeHumanitarianScopeVocabulary
#' @description The Humanitarian Scope Vocabulary codelist defines a range of
#' external codelists which themselves provide codes and descriptions for
#' humanitarian events and actions.
#' @format A data frame with 3 rows and 6 variables:
#' \describe{
#'   \item{\code{code}}{double code}
#'   \item{\code{name}}{character name}
#'   \item{\code{description}}{character description}
#'   \item{\code{category}}{double  category}
#'   \item{\code{url}}{character url}
#'   \item{\code{status}}{character status}
#'}
#' @source \url{https://iatistandard.org/en/iati-standard/203/codelists/}
#' @examples
#' {
#' knitr::kable(head(codeHumanitarianScopeVocabulary, 10))
#'}
"codeHumanitarianScopeVocabulary"


#' @title codeIATIOrganisationIdentifier
#' @description This is a list of organisation identifiers that is maintained by
#'  the IATI Secretariat. The prefix for organisations on this list is XI-IATI
#'    If a bona fide organisation is not registered with any recognised or
#'    appropriate registration agency
#'    (http://iatistandard.org/202/codelists/OrganisationRegistrationAgency/)
#'    they should contact the IATI Technical Team who will exceptionally allocate
#'     an organisation identifier using the XI-IATI prefix.
#'
#'     While some of these identifiers have been derived from DAC codes, this
#'     ‘meaning’ is not carried forward. i.e. IATI generated identifiers have no
#'      intrinsic meaning.
#'    For general guidance about constructing Organisation Identifiers, please see
#'     http://iatistandard.org/organisation-identifiers/
#' @format A data frame with 39 rows and 6 variables:
#' \describe{
#'   \item{\code{code}}{double code}
#'   \item{\code{name}}{character name}
#'   \item{\code{description}}{character description}
#'   \item{\code{category}}{double  category}
#'   \item{\code{url}}{character url}
#'   \item{\code{status}}{character status}
#'}
#' @source \url{https://iatistandard.org/en/iati-standard/203/codelists/}
#' @examples
#' {
#' knitr::kable(head(codeIATIOrganisationIdentifier, 10))
#'}
"codeIATIOrganisationIdentifier"


#' @title codeIndicatorMeasure
#' @description To specify how an indicator is being measured.
#' This includes qualitative and quantitative values.
#' @format A data frame with 5 rows and 6 variables:
#' \describe{
#'   \item{\code{code}}{double code}
#'   \item{\code{name}}{character name}
#'   \item{\code{description}}{character description}
#'   \item{\code{category}}{double  category}
#'   \item{\code{url}}{character url}
#'   \item{\code{status}}{character status}
#'}
#' @source \url{https://iatistandard.org/en/iati-standard/203/codelists/}
#' @examples
#' {
#' knitr::kable(head(codeIndicatorMeasure, 10))
#'}
"codeIndicatorMeasure"


#' @title codeIndicatorVocabulary
#' @description The Indicator Vocabulary codelist defines a range of external
#' codelists which themselves provide codes and descriptions for indicators,
#' for example to specify results.
#' @format A data frame with 10 rows and 6 variables:
#' \describe{
#'   \item{\code{code}}{double code}
#'   \item{\code{name}}{character name}
#'   \item{\code{description}}{character description}
#'   \item{\code{category}}{double  category}
#'   \item{\code{url}}{character url}
#'   \item{\code{status}}{character status}
#'}
#' @source \url{https://iatistandard.org/en/iati-standard/203/codelists/}
#' @examples
#' {
#' knitr::kable(head(codeIndicatorVocabulary, 10))
#'}
"codeIndicatorVocabulary"


#' @title codeOrganisationIdentifier
#' @description As of 1.04 this list is no longer maintained.
#'  http://support.iatistandard.org/entries/28497976-Retire-the-Organisation-Identifier-codelist#view-post-25368673
#'    For general guidance about constructing Organisation Identifiers,
#'    please see http://iatistandard.org/organisation-identifiers/
#' @format A data frame with 419 rows and 6 variables:
#' \describe{
#'   \item{\code{code}}{double code}
#'   \item{\code{name}}{character name}
#'   \item{\code{description}}{character description}
#'   \item{\code{category}}{double  category}
#'   \item{\code{url}}{character url}
#'   \item{\code{status}}{character status}
#'}
#' @source \url{https://iatistandard.org/en/iati-standard/203/codelists/}
#' @examples
#' {
#' knitr::kable(head(codeOrganisationIdentifier, 10))
#'}
"codeOrganisationIdentifier"


#' @title codeOrganisationRegistrationAgency
#' @description The values from this codelist are used to identify the particular
#'  list that an organisation identifier was drawn from. The codelist provides a
#'  register of known identifier lists, including national company registers,
#'  NGO directories and international and multilateral organisation lists -
#'  along with guidance and online resources to help locate the identifiers
#'  assigned to a specific organisation.
#'  As of 17 July 2017 this list is maintained by the org-id.guide project.
#'  Data publishers can now search for and locate the relevant list for a
#'  particular organisation identifier using the org-id.guide website.
#'
#'  The full register of identifier sources is also available to download
#'  in XML, JSON and CSV formats.
#'
#'  IATI periodically replicates the codelist of identifier sources
#'  from org-id.guide, to assist those accessing IATI documentation.
#'  However, it is advised that the most up-to-date source is the
#'  org-id.guide project.
#'
#'  If org-id.guide does not contain an entry for the kind of
#'  organisation you need to identify, you can make a request a
#'  new list is included in the register following the guidance
#'
#' @format A data frame with 197 rows and 7 variables:
#' \describe{
#'   \item{\code{code}}{double code}
#'   \item{\code{name}}{character name}
#'   \item{\code{description}}{character description}
#'   \item{\code{category}}{double  category}
#'   \item{\code{url}}{character url}
#'   \item{\code{status}}{character status}
#'   \item{\code{public-database}}{logical public-database}
#'}
#' @source \url{https://iatistandard.org/en/iati-standard/203/codelists/}
#' @examples
#' {
#' knitr::kable(head(codeOrganisationRegistrationAgency, 10))
#'}
"codeOrganisationRegistrationAgency"


#' @title codeOrganisationRole
#' @description IATI codes for the role of an organisation within an activity.
#'  An organisation can play more than one role within an activity.
#'    This is a Core codelist.
#' @format A data frame with 4 rows and 6 variables:
#' \describe{
#'   \item{\code{code}}{double code}
#'   \item{\code{name}}{character name}
#'   \item{\code{description}}{character description}
#'   \item{\code{category}}{double  category}
#'   \item{\code{url}}{character url}
#'   \item{\code{status}}{character status}
#'}
#' @source \url{https://iatistandard.org/en/iati-standard/203/codelists/organisationrole/}
#' @examples
#' {
#' knitr::kable(head(codeOrganisationRole, 10))
#'}
"codeOrganisationRole"  

#' @title codeOrganisationType
#' @description This is a Non-Core codelist
#' @format A data frame with 16 rows and 6 variables:
#' \describe{
#'   \item{\code{code}}{double code}
#'   \item{\code{name}}{character name}
#'   \item{\code{description}}{character description}
#'   \item{\code{category}}{double  category}
#'   \item{\code{url}}{character url}
#'   \item{\code{status}}{character status}
#'}
#' @source \url{https://iatistandard.org/en/iati-standard/203/codelists/organisationtype/}
#' @examples
#' {
#' knitr::kable(head(codeOrganisationType, 10))
#'}
"codeOrganisationType"

#' @title codePolicyMarker
#' @description The Policy Marker codelist is derived from the policy markers
#'  declared by the WP-STAT. The codes themselves are created by IATI.
#'    External URL: http://www.oecd.org/dac/stats/dacandcrscodelists.htm
#' @format A data frame with 12 rows and 6 variables:
#' \describe{
#'   \item{\code{code}}{double code}
#'   \item{\code{name}}{character name}
#'   \item{\code{description}}{character description}
#'   \item{\code{category}}{double  category}
#'   \item{\code{url}}{character url}
#'   \item{\code{status}}{character status}
#'}
#' @source \url{https://iatistandard.org/en/iati-standard/203/codelists/}
#' @examples
#' {
#' knitr::kable(head(codePolicyMarker, 10))
#'}
"codePolicyMarker"


#' @title codeUNSDGGoals
#' @description A value from the top-level list of UN sustainable development
#' goals (SDGs) (e.g. ‘1’)
#'   External URL: https://sustainabledevelopment.un.org/?menu=1300
#' @format A data frame with 17 rows and 6 variables:
#' \describe{
#'   \item{\code{code}}{double code}
#'   \item{\code{name}}{character name}
#'   \item{\code{description}}{character description}
#'   \item{\code{category}}{double  category}
#'   \item{\code{url}}{character url}
#'   \item{\code{status}}{character status}
#'}
#' @source \url{https://iatistandard.org/en/iati-standard/203/codelists/}
#' @examples
#' {
#' knitr::kable(head(codeUNSDGGoals, 10))
#'}
"codeUNSDGGoals"


#' @title codeUNSDGTargets
#' @description A value from the second-level list of UN sustainable development
#' goals (SDGs) (e.g. ‘1.1’)
#'   External URL: https://unstats.un.org/sdgs/indicators/indicators-list/
#' @format A data frame with 169 rows and 6 variables:
#' \describe{
#'   \item{\code{code}}{double code}
#'   \item{\code{name}}{character name}
#'   \item{\code{description}}{character description}
#'   \item{\code{category}}{double  category}
#'   \item{\code{url}}{character url}
#'   \item{\code{status}}{character status}
#'}
#' @source \url{https://iatistandard.org/en/iati-standard/203/codelists/}
#' @examples
#' {
#' knitr::kable(head(codeUNSDGTargets, 10))
#'}
"codeUNSDGTargets"


#' @title codeTransactionType
#' @description Transaction Type -   This is a Core codelist.
#' @format A data frame with 13 rows and 6 variables:
#' \describe{
#'   \item{\code{code}}{double code}
#'   \item{\code{name}}{character name}
#'   \item{\code{description}}{character description}
#'   \item{\code{category}}{double  category}
#'   \item{\code{url}}{character url}
#'   \item{\code{status}}{character status}
#'}
#' @source \url{https://iatistandard.org/en/iati-standard/203/codelists/}
#' @examples
#' {
#' knitr::kable(head(codeTransactionType, 10))
#'}
"codeTransactionType"


#' @title codeSectorVocabulary
#' @description This is a Non-Core codelist.
#' @format A data frame with 13 rows and 6 variables:
#' \describe{
#'   \item{\code{code}}{double code}
#'   \item{\code{name}}{character name}
#'   \item{\code{description}}{character description}
#'   \item{\code{category}}{double  category}
#'   \item{\code{url}}{character url}
#'   \item{\code{status}}{character status}
#'}
#' @source \url{https://iatistandard.org/en/iati-standard/203/codelists/sectorvocabulary/}
#' @examples
#' {
#' knitr::kable(head(codeSectorVocabulary, 10))
#'}
"codeSectorVocabulary"


#' @title codeHumCluster
#' @description Global Coordination Groups - Cluster & Area of Interest
#' Official Names and Codes (Beta)
#' Contains IASC designated Global Clusters and Areas of Responsibility.
#' Global Clusters and Areas of Responsibility (AoR) were defined to enable more
#'  predictable leadership in situations of humanitarian emergency.
#'  The content includes the Preferred Term to be used for each Cluster and AoR,
#'   the Acronym (3-letter cluster code), the Group to which the term belongs
#'   (defining whether it is a Global Cluster or AoR) and the website URL.
#'    Both the Google Spreadsheet and CSV versions contain HXL hashtags.
#'      For more information, please visit http://vocabulary.unocha.org/
#' @format A data frame with 16 rows and 9 variables:
#' \describe{
#'   \item{\code{HRinfo ID}}{character COLUMN_DESCRIPTION}
#'   \item{\code{Preferred Term}}{character COLUMN_DESCRIPTION}
#'   \item{\code{Preferred Term (fr)}}{character COLUMN_DESCRIPTION}
#'   \item{\code{ACRONYM}}{character COLUMN_DESCRIPTION}
#'   \item{\code{Group Type}}{character COLUMN_DESCRIPTION}
#'   \item{\code{Homepage}}{character COLUMN_DESCRIPTION}
#'   \item{\code{Date Created (Post Date)}}{character COLUMN_DESCRIPTION}
#'   \item{\code{Updated date}}{character COLUMN_DESCRIPTION}
#'   \item{\code{Notes}}{character COLUMN_DESCRIPTION}
#'}
#' @source \url{https://iatistandard.org/en/iati-standard/203/codelists/}
#' @examples
#' {
#' knitr::kable(head(codeHumCluster, 10))
#'}
"codeHumCluster"


#' @title codeResultType
#' @description This is a Non-Core codelist.
#' @format A data frame with 4 rows and 6 variables:
#' \describe{
#'   \item{\code{code}}{double COLUMN_DESCRIPTION}
#'   \item{\code{name}}{character COLUMN_DESCRIPTION}
#'   \item{\code{description}}{character COLUMN_DESCRIPTION}
#'   \item{\code{category}}{logical COLUMN_DESCRIPTION}
#'   \item{\code{url}}{logical COLUMN_DESCRIPTION}
#'   \item{\code{status}}{character COLUMN_DESCRIPTION}
#'}
#' @source \url{https://iatistandard.org/en/iati-standard/203/codelists/resulttype/}
#' @examples
#' {
#' knitr::kable(head(codeResultType, 10))
#'}
"codeResultType"


