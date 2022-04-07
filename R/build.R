# A workflow to pull and tidy IATI data for UNHCR - https://reporting.unhcr.org/iati
# ==============================================================================
t1 <- Sys.time() 

fs::dir_ls("R/source/", recurse = TRUE, type = "file") |> purrr::walk(source)

# create folder -----------------------------------------------------------
dir_create("data_wrangle") 

# read data ---------------------------------------------------------------
iati_file <- file_temp()

download.file('https://reporting.unhcr.org/sites/default/files/IATI/UNHCR-Activities-2022.xml', 
              iati_file, 
              quiet = TRUE)

# list tasks --------------------------------------------------------------
iati_extractors <- list(iati_activity = iati_activity,
                        iati_budget = iati_budget,
                        iati_default_aid_type = iati_default_aid_type,
                        iati_document_link = iati_document_link,
                        iati_humanitarian_scope = iati_humanitarian_scope,
                        iati_location = iati_location,
                        iati_participating_org = iati_participating_org,
                        iati_related_activity = iati_related_activity,
                        iati_result = iati_result,
                        iati_sector = iati_sector,
                        iati_transaction = iati_transaction)

# run each one of the tasks ------------
plan(multisession)

iati_extractors |> 
  future_map(~rlang::exec(., read_xml(iati_file))) |> 
  iwalk(~assign(.y, .x, envir = .GlobalEnv))

rm(list = ls(pattern = "(iati|xml)"))

Sys.time() - t1
