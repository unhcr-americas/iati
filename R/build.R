# A workflow to pull and tidy IATI data for UNHCR - https://reporting.unhcr.org/iati
# ==============================================================================
t1 <- Sys.time() 
setup_files <- sprintf(
  here::here("R/source/%s.R"), c("requirements", "funs")
)

purrr::walk(setup_files, source)


# create folder -----------------------------------------------------------

dir_create("data_wrangle") 

# read data ---------------------------------------------------------------

xml_iati <- read_xml('https://reporting.unhcr.org/sites/default/files/IATI/UNHCR-Activities-2022.xml')


# list tasks --------------------------------------------------------------

# run each one of the tasks
# tasks_folder <- here("R/source/tasks/")

# names such as 1_extract_data denote the folder
# the string is the particular task within each folder

task_iati <- c(
  "1_extract_data" = "iati_activity",
  "1_extract_data" = "iati_budget",            
  "1_extract_data" = "iati_default_aid_type",   
  "1_extract_data" = "iati_document_link",
  "1_extract_data" = "iati_humanitarian_scope",
  "1_extract_data" = "iati_location",
  "1_extract_data" = "iati_participating_org",
  "1_extract_data" = "iati_related_activity",
  "1_extract_data" = "iati_result",
  "1_extract_data" = "iati_sector",
  "1_extract_data" = "iati_transaction"
  )
              
domain_iati <- names(task_iati)

setup_iati_tasks <- sprintf(
  here::here("R/source/tasks/%s.R"), paste(domain_iati, task_iati, sep = "/")
)

walk(
  setup_iati_tasks,
  source_utf8
)

# remove unwanted objects -------------------------------------------------
rm(domain_iati,
   setup_files,
   setup_iati_tasks,
   task_iati,
   source_utf8,
   xml_iati,
   xml_attr_by_name,
   xml_child_attr_by_name,
   xml_text_by_lang,
   xml_text_by_name
   )

Sys.time() - t1
