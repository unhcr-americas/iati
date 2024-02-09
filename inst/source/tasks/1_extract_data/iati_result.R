iati_result <- function(xml_iati) {
# xml subset Extraction:--------------------------------------------------------------
#   The function starts by extracting a subset of XML data related to results.
#  It looks for all nodes with the name iati-activity/result/indicator using xml_find_all.
#  The result is stored in the notesets_indicator variable.
  
  
notesets_indicator <- xml_iati %>% 
  xml_find_all('.//iati-activity/result/indicator') |> 
  map(xml_children)


# Data Extraction and Transformation:------------------------------------------------------------

# The function then processes each indicator node in the notesets_indicator subset.
df_result <- map_dfr(notesets_indicator, function(i) {
  
  # For each indicator, it extracts relevant information into a tibble (data frame): 
  tibble(
    # Tries to find the IATI identifier associated with the indicator.
    iati_identifier = tryCatch(
      i |> xml_parent() |> xml_parent() |> xml_parent() |> xml_find_all("iati-identifier") |> xml_text(),
      error = function(e) {
        NA_character_
      }
    ),
    # Tries to extract the type of result (output, outcome, etc.).
    result_type = tryCatch(
      i |> xml_parent() |> xml_parent() |> xml_attr("type"),
      error = function(e) {
        NA_character_
      }
    ),
    ## Applies for the whole results the indicator is linked to...
    result_title = i |>  
      xml_parent() |>  
      xml_parent() |> 
      xml_find_first("title") |> 
      xml_text(),
     
    
    
    
    ## metadata for the indicator itself..
   #  result_aggregation_status = tryCatch(
   #    i |> xml_parent() |> xml_parent() |> xml_attr("aggregation-status"),
   #    error = function(e) {
   #      NA_character_
   #    }
   #  ), 
   #  result_ascending = tryCatch(
   #    i |> xml_parent() |> xml_parent() |> xml_attr("ascending"),
   #    error = function(e) {
   #      NA_character_
   #    }
   #  ),
   # # result_indicator_measure = i |>  xml_parent() |> xml_attr("measure"), 
   #  result_measure = tryCatch(
   #    i |> xml_parent() |> xml_parent() |> xml_attr("measure"),
   #    error = function(e) {
   #      NA_character_
   #    }
   #  ),
    
   result_indicator_title = xml_text_by_name(i, ".", "title"),
   result_indicator_measure = i |>  xml_parent() |> xml_attr("measure"),
   result_indicator_aggregation_status = i |>  xml_parent() |> xml_attr("aggregation-status"),
   result_indicator_ascending = i |>  xml_parent() |> xml_attr("ascending"),
   result_indicator_reference_code = xml_child_attr_by_name(i, "reference", "code", 1),
   result_indicator_reference_uri = xml_child_attr_by_name(i, "reference", "indicator-uri", 1),
   result_indicator_reference_vocabulary = xml_child_attr_by_name(i, "reference", "vocabulary", 1),
   
    
    ## Check baseline 
    result_indicator_baseline_location_ref = xml_child_attr_by_name(i, "location", "ref"),
    result_indicator_baseline_value = xml_attr_by_name(i, ".", "baseline", "value"),
    result_indicator_baseline_year = xml_attr_by_name(i, ".", "baseline", "year"),
    result_indicator_baseline_date = xml_attr_by_name(i, ".", "baseline", "iso-date"),
    
    result_indicator_baseline_dimension_1 = xml_child_attr_by_name(i, "dimension", "name", 1),
    result_indicator_baseline_dimension_value_1 = xml_child_attr_by_name(i, "dimension", "value", 1),
    result_indicator_baseline_dimension_2 = xml_child_attr_by_name(i, "dimension", "name", 2),
    result_indicator_baseline_dimension_value_2 = xml_child_attr_by_name(i, "dimension", "value", 2),
    
   ## Check period... 
   
    ## First time for the period...
    result_indicator_period_start = xml_attr_by_name(i, "period-start", "period-start", "iso-date"),
    result_indicator_period_end = xml_attr_by_name(i, "period-end", "period-end", "iso-date"),
   
    ## Value for target
    result_indicator_target_value = xml_attr_by_name(i, "target", "target", "value"),
    result_indicator_target_location_ref = xml_attr_by_name(i, "target/location", "location", "ref"),
    result_indicator_target_dimension_1 = xml_attr_by_name(i, "./target/dimension", "dimension", "name", 1),
    result_indicator_target_value_1 = xml_attr_by_name(i, "./target/dimension", "dimension", "value", 1),
    result_indicator_target_dimension_2 = xml_attr_by_name(i, "./target/dimension", "dimension", "name", 2),
    result_indicator_target_value_2 = xml_attr_by_name(i, "./target/dimension", "dimension", "value", 2),
   
   ## Value for actual
   result_indicator_actual_value = xml_attr_by_name(i, "actual", "actual", "value"),
   result_indicator_actual_location_ref = xml_attr_by_name(i, "actual/location", "location", "ref"),
   result_indicator_actual_dimension_1 = xml_attr_by_name(i, "./actual/dimension", "dimension", "name", 1),
   result_indicator_actual_value_1 = xml_attr_by_name(i, "./actual/dimension", "dimension", "value", 1),
   result_indicator_actual_dimension_2 = xml_attr_by_name(i, "./actual/dimension", "dimension", "name", 2),
   result_indicator_actual_value_2 = xml_attr_by_name(i, "./actual/dimension", "dimension", "value", 2)
   
   
  )
  
})


# remove unwanted objects -------------------------------------------------
rm(notesets_indicator)


# write data --------------------------------------------------------------
write_xlsx(
  df_result,
  paste0(folder_name, "/", "iati_result", ".xlsx")
)

df_result
}
