# A workflow to pull and tidy IATI data for UNHCR - https://reporting.unhcr.org/iati
# ==============================================================================
t1 <- Sys.time() 

fs::dir_ls("inst/source/", recurse = TRUE, type = "file") |> purrr::walk(source)

# create folder -----------------------------------------------------------
folder_name = "data-raw-iom"
dir_create(folder_name) 

# read data ---------------------------------------------------------------
iati_file <- file_temp()

download.file('https://data.iom.int/data/acc-IOM.xml', 
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

Sys.time() - t1

rm(iati_extractors,
   iati_file,
   t1,
   xml_attr_by_name,
   xml_child_attr_by_name,
   xml_text_by_lang,
   xml_text_by_name)
