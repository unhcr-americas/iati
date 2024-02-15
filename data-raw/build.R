# Package building function
#
# This function pulls data from HDX and then tidy them a bit to be ready for R

# Check that the usethis package is also installed. If not:
#install.packages("usethis")
#devtools::document()

#install.packages("pkgdown")

#library("pkgdown")
#pkgdown::build_site()


## a few other exploration of the package
#devtools::release()
# devtools::build_win(version = c("R-release", "R-devel"))

#install.packages("sinew")
#devtools::install_github("mdlincoln/docthis")
library(tidyverse)
library(readr)
library(sinew)
#library(docthis)
 


### Build each frame documentation 

## iati_activity ##########
activity <- rbind( 
  readxl::read_excel( here::here("data-raw/unhcr_2016", "iati_activity.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2017", "iati_activity.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2018", "iati_activity.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2019", "iati_activity.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2020", "iati_activity.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2021", "iati_activity.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2022", "iati_activity.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2023", "iati_activity.xlsx"), sheet = "Sheet1"))

#names(activity)
#str(activity)

## Cleaning a bit to match with code.. 
activity$reporting_org_type  <- as.numeric(activity$reporting_org_type)
activity$description_type_1  <- as.numeric(activity$description_type_1)
activity$description_type_2  <- as.numeric(activity$description_type_2)
activity$activity_status_code  <- as.numeric(activity$activity_status_code)
activity$activity_date_type_1 <- as.numeric(activity$activity_date_type_1)
activity$activity_date_type_2 <- as.numeric(activity$activity_date_type_2)
activity$activity_date_type_3 <- as.numeric(activity$activity_date_type_3)
activity$activity_date_type_4 <- as.numeric(activity$activity_date_type_4)

activity$activity_scope_code <- as.numeric(activity$activity_scope_code)
#activity$recipient_country_code <- as.numeric(activity$recipient_country_code)
activity$recipient_region_code <- as.numeric(activity$recipient_region_code)
activity$collaboration_type_code <- as.numeric(activity$collaboration_type_code)
activity$recipient_region_vocabulary <- as.numeric(activity$recipient_region_vocabulary)
activity$default_flow_type_code <- as.numeric(activity$default_flow_type_code)
activity$default_finance_type_code <- as.numeric(activity$default_finance_type_code)
activity$default_tied_status_code <- as.numeric(activity$default_tied_status_code)
activity$capital_spend <- as.numeric(activity$capital_spend)

activity$activity_date_1  <- lubridate::as_date(activity$activity_date_1)
activity$activity_date_2  <- lubridate::as_date(activity$activity_date_2)
activity$activity_date_3  <- lubridate::as_date(activity$activity_date_3)
activity$activity_date_4  <- lubridate::as_date(activity$activity_date_4)


activity <- activity |>
  dplyr::mutate( 
  iati_identifier_year_reg_ops = stringr::str_remove(
    string = iati_identifier, 
    pattern = "XM-DAC-41121-"),
   year = stringr::str_sub(iati_identifier_year_reg_ops, 
                                          start = 1, 
                                          end = 4),
  iati_identifier_reg_ops = stringr::str_sub(iati_identifier_year_reg_ops, 
                                             start = 6),
  is_operation = grepl("-", iati_identifier_reg_ops ),
  sep = dplyr::if_else( is_operation =="TRUE",
                        stringr::str_locate( 
                          string = iati_identifier_reg_ops,
                          pattern = "-"),
                        0)[,1]   , 
  programmme  = dplyr::if_else( is_operation =="TRUE",
                                         stringr::str_sub(iati_identifier_reg_ops,
                                                          start = 0,
                                                          end = sep-1 ),
                                         iati_identifier_reg_ops  ),
  programmme_lab = dplyr::recode(programmme ,
                                          "AFR"  = "Africa"    ,
                                          "AME" =  "The Americas" ,
                                          "ASO" = "Asia and the Pacific"  ,     
                                          "EHGL" = "East and Horn of Africa"    ,
                                          "EUR"  = "Europe"   ,  
                                          "GLOBALPROG" = "Global Program" ,
                                          "HQ"  = "Head Quarter"      , 
                                          "JPO"  = "Junior Professional Officer"     ,
                                          "MENA" ="Middle East and North Africa"     , 
                                          "SA"   = "Southern Africa"     , 
                                          "SAO"    = "Southern Africa"   ,  
                                          "WCA"    =  "West and Central Africa"  ),
  iati_identifier_ops  = dplyr::if_else(  is_operation =="TRUE",
                                          stringr::str_sub(iati_identifier_reg_ops,
                                                           start =   sep + 1 ),
                                          ""),
  ## Extract Country Code
  iso3c  =    stringr::str_sub(iati_identifier_ops ,
                                             start =  0,
                                             end =3),
  ## Detect Operation type
  ops_type  =     dplyr::if_else(
    stringr::str_length(iati_identifier_ops) > 3 ,
    stringr::str_sub(iati_identifier_ops ,
                     start =  4),
    ""),
  ## Get country name 
  ctr_name  =   countrycode::countrycode(iso3c ,
                               origin = "iso3c",
                               destination = "country.name"),
  ##  Add UNHCR Region
  unhcr_region  =   countrycode::countrycode(iso3c ,
                               origin = "iso3c",
                              destination = "unhcr.region") ) |>
  ## Remove 
 dplyr::select( - iati_identifier_year_reg_ops) |>
 dplyr::select( - sep)  |> 
 
  ## Adding look up table 
 dplyr::left_join(iati::codeOrganisationType |> 
                     dplyr::mutate(reporting_org_type_name = name,
                                   reporting_org_type_description = description) |> 
                     dplyr::select(code, 
                                   reporting_org_type_name ,
                                   reporting_org_type_description) ,
                   by= c("reporting_org_type" = "code"))  |>
  
  dplyr::left_join(iati::codeActivityStatus |> 
                     dplyr::mutate(activity_status_name = name,
                                   activity_status_description = description) |> 
                     dplyr::select(code, 
                                   activity_status_name ,
                                   activity_status_description) ,
                   by= c("activity_status_code" = "code"))  |>
  
  dplyr::left_join(iati::codeActivityScope |> 
                     dplyr::mutate(activity_scope_name = name,
                                   activity_scope_description = description) |> 
                     dplyr::select(code, 
                                   activity_scope_name ,
                                   activity_scope_description) ,
                   by= c("activity_scope_code" = "code"))  |>
  
  dplyr::left_join(iati::codeCollaborationType |> 
                     dplyr::mutate(collaboration_type_name = name,
                                   collaboration_type_description = description) |> 
                     dplyr::select(code, collaboration_type_name ,
                                   collaboration_type_description ) ,
                   by= c("collaboration_type_code" = "code")) 

str(activity)
#View(activity)
sinew::makeOxygen(activity, add_fields = "source")
dataActivity <- activity
save(dataActivity, file =  "data/dataActivity.RData")
# Note: significantly better compression could be obtained
#by using R CMD build --resave-data
tools::resaveRdaFiles(here::here("data","dataActivity.RData"),compress="xz")

## iati_budget ##########
budget <- rbind( 
  readxl::read_excel( here::here("data-raw/unhcr_2016", "iati_budget.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2017", "iati_budget.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2018", "iati_budget.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2019", "iati_budget.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2020", "iati_budget.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2021", "iati_budget.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2022", "iati_budget.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2023", "iati_budget.xlsx"), sheet = "Sheet1"))


budget$budget_type <- as.numeric(budget$budget_type)
budget$budget_status <- as.numeric(budget$budget_status)
budget$budget_value <- as.numeric(budget$budget_value)

budget <- budget |>
  ## Adding look up table 
  dplyr::left_join(iati::codeBudgetType |> 
                     dplyr::mutate(budget_type_name = name,
                                   budget_type_description = description) |> 
                     dplyr::select(code, 
                                   budget_type_name ,
                                   budget_type_description) ,
                   by= c("budget_type" = "code"))  |>
  ## Adding look up table 
  dplyr::left_join(iati::codeBudgetStatus |> 
                     dplyr::mutate(budget_status_name = name,
                                   budget_status_description = description) |> 
                     dplyr::select(code, 
                                   budget_status_name ,
                                   budget_status_description) ,
                   by= c("budget_status" = "code")) 
 

names(budget)
sinew::makeOxygen(budget, add_fields = "source")
dataBudget <- budget
save(dataBudget, file =  "data/dataBudget.RData")
# Note: significantly better compression could be obtained
#by using R CMD build --resave-data
tools::resaveRdaFiles(here::here("data","dataBudget.RData"),compress="xz")

## iati_default_aid_type ##########
default_aid_type <- rbind( 
  readxl::read_excel( here::here("data-raw/unhcr_2016", "iati_default_aid_type.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2017", "iati_default_aid_type.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2018", "iati_default_aid_type.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2019", "iati_default_aid_type.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2020", "iati_default_aid_type.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2021", "iati_default_aid_type.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2022", "iati_default_aid_type.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2023", "iati_default_aid_type.xlsx"), sheet = "Sheet1"))

names(default_aid_type)
sinew::makeOxygen(default_aid_type, add_fields = "source")
dataDefault_aid_type <- default_aid_type
save(dataDefault_aid_type, file =  "data/dataDefault_aid_type.RData")
# Note: significantly better compression could be obtained
#by using R CMD build --resave-data
#tools::resaveRdaFiles(here::here("data","dataDefault_aid_type.RData"),compress="bzip2")

## iati_document_link ##########
document_link <- rbind( 
  readxl::read_excel( here::here("data-raw/unhcr_2016", "iati_document_link.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2017", "iati_document_link.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2018", "iati_document_link.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2019", "iati_document_link.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2020", "iati_document_link.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2021", "iati_document_link.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2022", "iati_document_link.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2023", "iati_document_link.xlsx"), sheet = "Sheet1"))

names(document_link)
sinew::makeOxygen(document_link, add_fields = "source")
dataDocument_link <- document_link
save(dataDocument_link, file =  "data/dataDocument_link.RData")
# Note: significantly better compression could be obtained
#by using R CMD build --resave-data
tools::resaveRdaFiles(here::here("data","dataDocument_link.RData"),compress="bzip2")

## iati_humanitarian_scope ##########
humanitarian_scope <- rbind( 
  readxl::read_excel( here::here("data-raw/unhcr_2016", "iati_humanitarian_scope.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2017", "iati_humanitarian_scope.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2018", "iati_humanitarian_scope.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2019", "iati_humanitarian_scope.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2020", "iati_humanitarian_scope.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2021", "iati_humanitarian_scope.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2022", "iati_humanitarian_scope.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2023", "iati_humanitarian_scope.xlsx"), sheet = "Sheet1"))

names(humanitarian_scope)
sinew::makeOxygen(humanitarian_scope, add_fields = "source")
dataHumanitarian_scope <- humanitarian_scope
save(dataHumanitarian_scope, file =  "data/dataHumanitarian_scope.RData")
# Note: significantly better compression could be obtained
#by using R CMD build --resave-data
tools::resaveRdaFiles(here::here("data","dataHumanitarian_scope.RData"),compress="bzip2")

## iati_location ##########
location <- rbind( 
  readxl::read_excel( here::here("data-raw/unhcr_2016", "iati_location.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2017", "iati_location.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2018", "iati_location.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2019", "iati_location.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2020", "iati_location.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2021", "iati_location.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2022", "iati_location.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2023", "iati_location.xlsx"), sheet = "Sheet1"))

names(location)
sinew::makeOxygen(location, add_fields = "source")
dataLocation <- location
save(dataLocation, file =  "data/dataLocation.RData")
# Note: significantly better compression could be obtained
#by using R CMD build --resave-data
tools::resaveRdaFiles(here::here("data","dataLocation.RData"),compress="xz")

## iati_participating_org ##########
participating_org <- rbind( 
  readxl::read_excel( here::here("data-raw/unhcr_2016", "iati_participating_org.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2017", "iati_participating_org.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2018", "iati_participating_org.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2019", "iati_participating_org.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2020", "iati_participating_org.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2021", "iati_participating_org.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2022", "iati_participating_org.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2023", "iati_participating_org.xlsx"), sheet = "Sheet1"))

names(participating_org)
str(participating_org)

participating_org$participating_org_type <- as.numeric(participating_org$participating_org_type )
participating_org$participating_org_role  <- as.numeric(participating_org$participating_org_role )


participating_org <- participating_org |>
  ## Adding look up table 
  dplyr::left_join(iati::codeOrganisationType |> 
                     dplyr::mutate(participating_org_type_name = name,
                                   participating_org_type_description = description) |> 
                     dplyr::select(code, 
                                   participating_org_type_name ,
                                   participating_org_type_description) ,
                   by= c("participating_org_type" = "code")) |>
  ## Adding look up table 
  dplyr::left_join(iati::codeOrganisationRole |> 
                     dplyr::mutate(participating_org_role_name = name,
                                   participating_org_role_description = description) |> 
                     dplyr::select(code, 
                                   participating_org_role_name ,
                                   participating_org_role_description) ,
                   by= c("participating_org_role" = "code")) 

sinew::makeOxygen(participating_org, add_fields = "source")
dataParticipating_org <- participating_org
save(dataParticipating_org, file =  "data/dataParticipating_org.RData")
# Note: significantly better compression could be obtained
#by using R CMD build --resave-data
tools::resaveRdaFiles(here::here("data","dataParticipating_org.RData"),compress="bzip2")

## iati_related_activity ##########
related_activity <- rbind( 
  readxl::read_excel( here::here("data-raw/unhcr_2016", "iati_related_activity.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2017", "iati_related_activity.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2018", "iati_related_activity.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2019", "iati_related_activity.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2020", "iati_related_activity.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2021", "iati_related_activity.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2022", "iati_related_activity.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2023", "iati_related_activity.xlsx"), sheet = "Sheet1"))

names(related_activity)
sinew::makeOxygen(related_activity, add_fields = "source")
dataRelated_activity <- related_activity
save(dataRelated_activity, file =  "data/dataRelated_activity.RData")
# Note: significantly better compression could be obtained
#by using R CMD build --resave-data
tools::resaveRdaFiles(here::here("data","dataRelated_activity.RData"),compress="bzip2")

## iati_result ##########
result <- rbind( 
  readxl::read_excel( here::here("data-raw/unhcr_2016", "iati_result.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2017", "iati_result.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2018", "iati_result.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2019", "iati_result.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2020", "iati_result.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2021", "iati_result.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2022", "iati_result.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2023", "iati_result.xlsx"), sheet = "Sheet1"))


result$result_type <- as.numeric(result$result_type )
result$result_indicator_measure <- as.numeric(result$result_indicator_measure)

result <- result |>
  ## Adding look up table 
  dplyr::left_join(iati::codeResultType |> 
                     dplyr::mutate(result_type_name = name,
                                   result_type_description = description) |> 
                     dplyr::select(code, 
                                   result_type_name ,
                                   result_type_description) ,
                   by= c("result_type" = "code")) |>
  ## Adding look up table 
  dplyr::left_join(iati::codeIndicatorMeasure |> 
                     dplyr::mutate(indicator_measure_name = name,
                                   indicator_measure_description = description) |> 
                     dplyr::select(code, 
                                   indicator_measure_name ,
                                   indicator_measure_description) ,
                   by= c("result_indicator_measure" = "code")) 

names(result)
sinew::makeOxygen(result, add_fields = "source")
dataResult <- result
save(dataResult, file =  "data/dataResult.RData")

# Note: significantly better compression could be obtained
#by using R CMD build --resave-data
tools::resaveRdaFiles(here::here("data","dataResult.RData"),compress="bzip2")


## iati_sector ##########
sector <- rbind( 
  readxl::read_excel( here::here("data-raw/unhcr_2016", "iati_sector.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2017", "iati_sector.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2018", "iati_sector.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2019", "iati_sector.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2020", "iati_sector.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2021", "iati_sector.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2022", "iati_sector.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2023", "iati_sector.xlsx"), sheet = "Sheet1"))

sector$sector_vocabulary <- as.numeric(sector$sector_vocabulary)

sector <- sector |>
  ## Adding look up table 
  dplyr::left_join(iati::codeSectorVocabulary |> 
                     dplyr::mutate(sector_vocabulary_name = name,
                                   sector_vocabulary_description = description) |> 
                     dplyr::select(code, 
                                   sector_vocabulary_name ,
                                   sector_vocabulary_description) ,
                   by= c("sector_vocabulary" = "code"))


names(sector)
sinew::makeOxygen(sector, add_fields = "source")
dataSector <- sector
save(dataSector, file =  "data/dataSector.RData")
# Note: significantly better compression could be obtained
#by using R CMD build --resave-data
tools::resaveRdaFiles(here::here("data","dataSector.RData"),compress="bzip2")

## iati_transaction ##########
transaction <- rbind( 
  readxl::read_excel( here::here("data-raw/unhcr_2016", "iati_transaction.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2017", "iati_transaction.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2018", "iati_transaction.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2019", "iati_transaction.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2020", "iati_transaction.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2021", "iati_transaction.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2022", "iati_transaction.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2023", "iati_transaction.xlsx"), sheet = "Sheet1"))

str(transaction)
## Cleaning a bit to match with code.. 
transaction$transaction_provider_org_type  <- as.numeric(transaction$transaction_provider_org_type)
transaction$transaction_type_code   <- as.numeric(transaction$transaction_type_code )
levels(as.factor(transaction$transaction_aid_type_vocabulary_1))
table(transaction$transaction_aid_type_vocabulary_1, useNA = "ifany")
transaction$transaction_aid_type_vocabulary_1  <- as.numeric(transaction$transaction_aid_type_vocabulary_1)
levels(as.factor(transaction$transaction_aid_type_vocabulary_2))
table(transaction$transaction_aid_type_vocabulary_2, useNA = "ifany")
table(transaction$transaction_aid_type_vocabulary_2, transaction$transaction_aid_type_code_2, useNA = "ifany")

transaction$transaction_aid_type_vocabulary_2  <- as.numeric(transaction$transaction_aid_type_vocabulary_2)
transaction$transaction_value  <- as.numeric(transaction$transaction_value)
transaction$transaction_value_USD  <- as.numeric(transaction$transaction_value_USD)
transaction$transaction_value_date  <- lubridate::as_date(transaction$transaction_value_date)
transaction$transaction_date  <- lubridate::as_date(transaction$transaction_date)


transaction <- transaction |>
  ## Adding look up table 
  dplyr::left_join(iati::codeTransactionType |> 
                     dplyr::mutate(transaction_type_name = name,
                                   transaction_type_description = description) |> 
                     dplyr::select(code, 
                                   transaction_type_name ,
                                   transaction_type_description) ,
                   by= c("transaction_type_code" = "code"))  |> 
  ## Adding look up table 
  dplyr::left_join(iati::codeOrganisationType |> 
                     dplyr::mutate(provider_org_type_name = name ,
                                   provider_org_type_description = description) |> 
                     dplyr::select(code, provider_org_type_name, provider_org_type_description) ,
                   by= c("transaction_provider_org_type" = "code")) |> 
  ## Adding look up table 
  dplyr::left_join(iati::codeAidType |> 
                     dplyr::mutate(aid_type1_name = name,
                                   aid_type1_description = description) |> 
                     dplyr::select(code, 
                                   aid_type1_name ,
                                   aid_type1_description) ,
                   by= c("transaction_aid_type_code_1" = "code"))  |> 
  ## Adding look up table 
  dplyr::left_join(iati::codeEarmarkingCategory |> 
                     dplyr::mutate(code = as.character(code),
                                   earmarking_name = name,
                                   earmarking_description = description) |> 
                     dplyr::select(code, earmarking_name, earmarking_description  ) ,
                   by= c("transaction_aid_type_code_2" = "code" )) |>    
  ## Adding look up table 
  dplyr::left_join(iati::codeAidTypeVocabulary |> 
                     dplyr::mutate(aid_type_vocabulary1_name = name,
                                   aid_type_vocabulary1_description = description) |> 
                     dplyr::select(code,
                                   aid_type_vocabulary1_name,
                                   aid_type_vocabulary1_description  ) ,
                   by= c("transaction_aid_type_vocabulary_1" = "code"))  |> 
  ## Adding look up table  
  dplyr::left_join(iati::codeAidTypeVocabulary |> 
                     dplyr::mutate(aid_type_vocabulary2_name = name,
                                   aid_type_vocabulary2_description = description) |> 
                     dplyr::select(code, 
                                   aid_type_vocabulary2_name,
                                   aid_type_vocabulary2_description  ) ,
                   by= c("transaction_aid_type_vocabulary_2" = "code"))  


names(transaction)
sinew::makeOxygen(transaction, add_fields = "source")
dataTransaction <- transaction
save(dataTransaction, file =  "data/dataTransaction.RData")
# Note: significantly better compression could be obtained
#by using R CMD build --resave-data
tools::resaveRdaFiles(here::here("data","dataTransaction.RData"),compress="xz")

## code table need to change name... 

# 
# library(readr)
# codeCollaborationType <- read_csv("data-raw/code/CollaborationType.csv")
# sinew::makeOxygen(codeCollaborationType, add_fields = "source")
# save(codeCollaborationType, file =  "data/codeCollaborationType.RData")

# load("data/codeActivityDateType.RData")
# codeActivityDateType <- ActivityDateType
# save(codeActivityDateType, file =  "data/codeActivityDateType.RData")
# 

# codeBudgetType <- readr::read_csv("data-raw/code/BudgetType.csv") 
# sinew::makeOxygen(codeBudgetType, add_fields = "source") 
# save(codeBudgetType, file =  "data/codeBudgetType.RData")
# codeBudgetStatus <- readr::read_csv("data-raw/code/BudgetStatus.csv")  
# sinew::makeOxygen(codeBudgetStatus, add_fields = "source")
# save(codeBudgetStatus, file =  "data/codeBudgetStatus.RData")
# 
# load("data/codeActivityScope.RData")
# codeActivityScope <- ActivityScope
# save(codeActivityScope, file =  "data/codeActivityScope.RData")
# 
# 
# load("data/codeActivityStatus.RData")
# codeActivityStatus <- ActivityStatus
# save(codeActivityStatus, file =  "data/codeActivityStatus.RData")
# 
# 
# load("data/codeAidType.RData")
# codeAidType <- AidType
# save(codeAidType, file =  "data/codeAidType.RData")
# 
# 
# load("data/codeAidTypeCategory.RData")
# codeAidTypeCategory <- AidTypeCategory
# save(codeAidTypeCategory, file =  "data/codeAidTypeCategory.RData")
# 
# 
# load("data/codeAidTypeVocabulary.RData")
# codeAidTypeVocabulary <- AidTypeVocabulary
# save(codeAidTypeVocabulary, file =  "data/codeAidTypeVocabulary.RData")
# 
# 
# load("data/codeBudgetIdentifier.RData")
# codeBudgetIdentifier <- BudgetIdentifier
# save(codeBudgetIdentifier, file =  "data/codeBudgetIdentifier.RData")

# 
# load("data/codeBudgetIdentifierSector.RData")
# codeBudgetIdentifierSector <- BudgetIdentifierSector
# save(codeBudgetIdentifierSector, file =  "data/codeBudgetIdentifierSector.RData")
# 
# 
# load("data/codeSectorCategory.RData")
# codeSectorCategory <- SectorCategory
# save(codeSectorCategory, file =  "data/codeSectorCategory.RData")
# 
# 
# load("data/codeSector.RData")
#tools::resaveRdaFiles(here::here("data","codeSector.RData"),compress="bzip2")

# codeSector <- Sector
# save(codeSector, file =  "data/codeSector.RData")
# 
# 
# load("data/codeCashandVoucherModalities.RData")
# codeCashandVoucherModalities <- CashandVoucherModalities
# save(codeCashandVoucherModalities, file =  "data/codeCashandVoucherModalities.RData")
# 
# 
# load("data/codeCountry.RData")
# codeCountry <- Country
# save(codeCountry, file =  "data/codeCountry.RData")
# 
# 
# load("data/codeRegion.RData")
# codeRegion <- Region
# save(codeRegion, file =  "data/codeRegion.RData")
# 
# 
# load("data/codeCurrency.RData")
# codeCurrency <- Currency
# save(codeCurrency, file =  "data/codeCurrency.RData")
# 
# 
# load("data/codeDescriptionType.RData")
# codeDescriptionType <- DescriptionType
# save(codeDescriptionType, file =  "data/codeDescriptionType.RData")
# 
# 
# load("data/codeEarmarkingCategory.RData")
# codeEarmarkingCategory <- EarmarkingCategory
# save(codeEarmarkingCategory, file =  "data/codeEarmarkingCategory.RData")
# 
# load("data/codeFlowType.RData")
# codeFlowType <- FlowType
# save(codeFlowType, file =  "data/codeFlowType.RData")
# 
# 
# load("data/codeGeographicLocationClass.RData")
# codeGeographicLocationClass <- GeographicLocationClass
# save(codeGeographicLocationClass, file =  "data/codeGeographicLocationClass.RData")

# 
# load("data/codeHumanitarianScopeType.RData")
# codeHumanitarianScopeType <- HumanitarianScopeType
# save(codeHumanitarianScopeType, file =  "data/codeHumanitarianScopeType.RData")
# 
# 
# load("data/codeHumanitarianScopeVocabulary.RData")
# codeHumanitarianScopeVocabulary <- HumanitarianScopeVocabulary
# save(codeHumanitarianScopeVocabulary, file =  "data/codeHumanitarianScopeVocabulary.RData")
# 
# 
# load("data/codeIATIOrganisationIdentifier.RData")
# codeIATIOrganisationIdentifier <- IATIOrganisationIdentifier
# save(codeIATIOrganisationIdentifier, file =  "data/codeIATIOrganisationIdentifier.RData")
# 
# 
# 
# load("data/codeIndicatorMeasure.RData")
# codeIndicatorMeasure <- IndicatorMeasure
# save(codeIndicatorMeasure, file =  "data/codeIndicatorMeasure.RData")
# 
# 
# 
# load("data/codeIndicatorVocabulary.RData")
# codeIndicatorVocabulary <- IndicatorVocabulary
# save(codeIndicatorVocabulary, file =  "data/codeIndicatorVocabulary.RData")
# 
# 
# load("data/codeOrganisationIdentifier.RData")
# codeOrganisationIdentifier <- OrganisationIdentifier
# save(codeOrganisationIdentifier, file =  "data/codeOrganisationIdentifier.RData")
# 
# 
# load("data/codeOrganisationRegistrationAgency.RData")

# Note: significantly better compression could be obtained
#by using R CMD build --resave-data
#tools::resaveRdaFiles(here::here("data","codeOrganisationRegistrationAgency.RData"),compress="bzip2")
# codeOrganisationRegistrationAgency <- OrganisationRegistrationAgency
# save(codeOrganisationRegistrationAgency, file =  "data/codeOrganisationRegistrationAgency.RData")

# 
# load("data/codeOrganisationRole.RData")
# codeOrganisationRole <- OrganisationRole
# save(codeOrganisationRole, file =  "data/codeOrganisationRole.RData")
# 
# 
# load("data/codeOrganisationType.RData")
# codeOrganisationType <- OrganisationType
# save(codeOrganisationType, file =  "data/codeOrganisationType.RData")
# 
# load("data/codePolicyMarker.RData")
# codePolicyMarker <- PolicyMarker
# save(codePolicyMarker, file =  "data/codePolicyMarker.RData")
# 
# 
# load("data/codeUNSDGGoals.RData")
# codeUNSDGGoals <- UNSDGGoals
# save(codeUNSDGGoals, file =  "data/codeUNSDGGoals.RData")
# 
# 
# load("data/codeUNSDGTargets.RData")

#tools::resaveRdaFiles(here::here("data","codeUNSDGTargets.RData"),compress="bzip2")

# codeUNSDGTargets <- UNSDGTargets
# save(codeUNSDGTargets, file =  "data/codeUNSDGTargets.RData")
# 
# 
# load("data/codeTransactionType.RData")
# codeTransactionType <- TransactionType
# save(codeTransactionType, file =  "data/codeTransactionType.RData")
# 
# 
# load("data/codeSectorVocabulary.RData")
# codeSectorVocabulary <- SectorVocabulary
# save(codeSectorVocabulary, file =  "data/codeSectorVocabulary.RData")
# 
# load("data/codeHumCluster.RData")
# codeHumCluster <- HumCluster
# save(codeHumCluster, file =  "data/codeHumCluster.RData")
# 
# load("data/codeResultType.RData")
# codeResultType <- ResultType
# save(codeResultType, file =  "data/codeResultType.RData")
# 
# load("data/codeTransactionType.RData")
# codeTransactionType <- TransactionType
# save(codeTransactionType, file =  "data/codeTransactionType.RData")
 

