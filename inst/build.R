# A workflow to pull and tidy IATI data for UNHCR - https://reporting.unhcr.org/iati
# ==============================================================================

## Sourcing all the extraction functions...
fs::dir_ls("inst/source/", recurse = TRUE, type = "file") |> 
  purrr::walk(source)

# https://reporting.unhcr.org/files/IATI/UNHCR-Activities-2020.xml
# https://reporting.unhcr.org/files/IATI/UNHCR-Activities-2023.xml

# list_iati <- c("http://reporting.unhcr.org/files/IATI/UNHCR-Activities-2016.xml",
#                "http://reporting.unhcr.org/files/IATI/UNHCR-Activities-2017.xml",
#                "http://reporting.unhcr.org/files/IATI/UNHCR-Activities-2018.xml",
#                "http://reporting.unhcr.org/files/IATI/UNHCR-Activities-2019.xml",
#                "http://reporting.unhcr.org/files/IATI/UNHCR-Activities-2020.xml",
#                "http://reporting.unhcr.org/files/IATI/UNHCR-Activities-2021.xml",
#                "http://reporting.unhcr.org/files/IATI/UNHCR-Activities-2022.xml",
#                "http://reporting.unhcr.org/files/IATI/UNHCR-Activities-2023.xml"
#                )
                
#years <- c("2016", "2017", "2018", "2019", "2020", "2021", "2022", "2023")
#years <- c("2016", "2017",  "2023")
years <- c(  "2017")
for  (year in years) {
  
  #year <- "2022"
  t1 <- Sys.time() 
  cat(paste0("IATI data extraction for year: ", year, " starting job at ", t1, "\n"))
    
    # read data ---------------------------------------------------------------
    iati_file <- file_temp()
    download.file(paste0('https://reporting.unhcr.org/files/IATI/UNHCR-Activities-', year, '.xml'), 
                  iati_file, 
                  quiet = TRUE)
    
    # create folder -----------------------------------------------------------
    folder_name =  paste0('data-raw/unhcr_', year)
    dir_create(folder_name) 
    
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
                            iati_transaction = iati_transaction
                            )
    
    # run each one of the tasks ------------
    future::plan(multisession)
    
    iati_extractors |> 
      
      # Apply a function to each element of a vector via futures
      furrr::future_map(~rlang::exec(., read_xml(iati_file))) |> 
      purrr::iwalk(~assign(.y, .x, envir = .GlobalEnv))
  
    ## Print execution time...
    cat( paste0( "Caramba: Job completed at ", Sys.time(), " Execution time ", Sys.time()- t1, " mins \n ----- \n"))

}

# rm(iati_extractors,
#    iati_file,
#    t1,
#    xml_attr_by_name,
#    xml_child_attr_by_name,
#    xml_text_by_lang,
#    xml_text_by_name)
