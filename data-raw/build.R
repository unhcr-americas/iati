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
library(docthis)
 


### Build each frame documentation 

## iati_transaction ##########
activity <- rbind( 
  readxl::read_excel( here::here("data-raw/unhcr_2016", "iati_activity.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2017", "iati_activity.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2018", "iati_activity.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2019", "iati_activity.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2020", "iati_activity.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2021", "iati_activity.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2022", "iati_activity.xlsx"), sheet = "Sheet1"))

names(activity)
sinew::makeOxygen(activity, add_fields = "source")
save(activity, file =  "data/activity.RData")

## iati_budget ##########
budget <- rbind( 
  readxl::read_excel( here::here("data-raw/unhcr_2016", "iati_budget.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2017", "iati_budget.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2018", "iati_budget.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2019", "iati_budget.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2020", "iati_budget.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2021", "iati_budget.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2022", "iati_budget.xlsx"), sheet = "Sheet1"))

names(budget)
sinew::makeOxygen(budget, add_fields = "source")
save(budget, file =  "data/budget.RData")

## iati_default_aid_type ##########
default_aid_type <- rbind( 
  readxl::read_excel( here::here("data-raw/unhcr_2016", "iati_default_aid_type.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2017", "iati_default_aid_type.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2018", "iati_default_aid_type.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2019", "iati_default_aid_type.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2020", "iati_default_aid_type.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2021", "iati_default_aid_type.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2022", "iati_default_aid_type.xlsx"), sheet = "Sheet1"))

names(default_aid_type)
sinew::makeOxygen(default_aid_type, add_fields = "source")
save(default_aid_type, file =  "data/default_aid_type.RData")

## iati_document_link ##########
document_link <- rbind( 
  readxl::read_excel( here::here("data-raw/unhcr_2016", "iati_document_link.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2017", "iati_document_link.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2018", "iati_document_link.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2019", "iati_document_link.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2020", "iati_document_link.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2021", "iati_document_link.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2022", "iati_document_link.xlsx"), sheet = "Sheet1"))

names(document_link)
sinew::makeOxygen(document_link, add_fields = "source")
save(document_link, file =  "data/document_link.RData")

## iati_humanitarian_scope ##########
humanitarian_scope <- rbind( 
  readxl::read_excel( here::here("data-raw/unhcr_2016", "iati_humanitarian_scope.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2017", "iati_humanitarian_scope.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2018", "iati_humanitarian_scope.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2019", "iati_humanitarian_scope.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2020", "iati_humanitarian_scope.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2021", "iati_humanitarian_scope.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2022", "iati_humanitarian_scope.xlsx"), sheet = "Sheet1"))

names(humanitarian_scope)
sinew::makeOxygen(humanitarian_scope, add_fields = "source")
save(humanitarian_scope, file =  "data/humanitarian_scope.RData")

## iati_location ##########
location <- rbind( 
  readxl::read_excel( here::here("data-raw/unhcr_2016", "iati_location.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2017", "iati_location.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2018", "iati_location.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2019", "iati_location.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2020", "iati_location.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2021", "iati_location.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2022", "iati_location.xlsx"), sheet = "Sheet1"))

names(location)
sinew::makeOxygen(location, add_fields = "source")
save(location, file =  "data/location.RData")

## iati_participating_org ##########
participating_org <- rbind( 
  readxl::read_excel( here::here("data-raw/unhcr_2016", "iati_participating_org.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2017", "iati_participating_org.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2018", "iati_participating_org.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2019", "iati_participating_org.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2020", "iati_participating_org.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2021", "iati_participating_org.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2022", "iati_participating_org.xlsx"), sheet = "Sheet1"))

names(participating_org)
sinew::makeOxygen(participating_org, add_fields = "source")
save(participating_org, file =  "data/participating_org.RData")

## iati_related_activity ##########
related_activity <- rbind( 
  readxl::read_excel( here::here("data-raw/unhcr_2016", "iati_related_activity.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2017", "iati_related_activity.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2018", "iati_related_activity.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2019", "iati_related_activity.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2020", "iati_related_activity.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2021", "iati_related_activity.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2022", "iati_related_activity.xlsx"), sheet = "Sheet1"))

names(related_activity)
sinew::makeOxygen(related_activity, add_fields = "source")
save(related_activity, file =  "data/related_activity.RData")

## iati_result ##########
result <- rbind( 
  readxl::read_excel( here::here("data-raw/unhcr_2016", "iati_result.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2017", "iati_result.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2018", "iati_result.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2019", "iati_result.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2020", "iati_result.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2021", "iati_result.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2022", "iati_result.xlsx"), sheet = "Sheet1"))

names(result)
sinew::makeOxygen(result, add_fields = "source")
save(result, file =  "data/result.RData")

## iati_sector ##########
sector <- rbind( 
  readxl::read_excel( here::here("data-raw/unhcr_2016", "iati_sector.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2017", "iati_sector.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2018", "iati_sector.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2019", "iati_sector.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2020", "iati_sector.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2021", "iati_sector.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2022", "iati_sector.xlsx"), sheet = "Sheet1"))

names(sector)
sinew::makeOxygen(sector, add_fields = "source")
save(sector, file =  "data/sector.RData")

## iati_transaction ##########
transaction <- rbind( 
  readxl::read_excel( here::here("data-raw/unhcr_2016", "iati_transaction.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2017", "iati_transaction.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2018", "iati_transaction.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2019", "iati_transaction.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2020", "iati_transaction.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2021", "iati_transaction.xlsx"), sheet = "Sheet1"),
  readxl::read_excel( here::here("data-raw/unhcr_2022", "iati_transaction.xlsx"), sheet = "Sheet1"))

names(transaction)
sinew::makeOxygen(transaction, add_fields = "source")
save(transaction, file =  "data/transaction.RData")


