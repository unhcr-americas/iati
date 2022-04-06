
# xml subset --------------------------------------------------------------
notesets_location <- xml_iati %>% 
  xml_find_all('.//iati-activity/location')


# extract data ------------------------------------------------------------
df_location <- future_map_dfr(notesets_location, function(i) {
  tibble(
    iati_identifier = tryCatch(i |> xml_parent() |> xml_find_all("iati-identifier") |> xml_text(), error = function(e){ NA_character_}),
    location_ref = i |> xml_attr("ref"),
    location_reach = xml_attr_by_name(i, ".//location-reach", "location-reach", "code"),
    location_id_vocabulary = xml_attr_by_name(i, ".//location-id", "location-id", "vocabulary"),
    location_id_code = xml_attr_by_name(i, ".//location-id", "location-id", "code"),
    location_name = xml_text_by_name(i, ".//name", "name"),
    location_activity_descr = xml_text_by_name(i, ".//activity-description", "activity-description"),
    location_adm_vocabulary = xml_attr_by_name(i, ".//administrative", "administrative", "code"),
    location_adm_level = xml_attr_by_name(i, ".//administrative", "administrative", "vocabulary"),
    location_adm_code = xml_attr_by_name(i, ".//administrative", "administrative", "code"),
    location_lat = str_split(xml_text_by_name(i, ".//point", "point"), " ")[[1]][1],
    location_long = str_split(xml_text_by_name(i, ".//point", "point"), " ")[[1]][2],
    location_exactness_code = xml_attr_by_name(i, ".//exactness", "exactness", "code"),
    location_class_code = xml_attr_by_name(i, ".//location-class", "location-class", "code"),
    location_feature_designation_code = xml_attr_by_name(i, ".//feature-designation", "feature-designation", "code")
  )
  
}, .progress = TRUE)


# remove unwanted objects -------------------------------------------------
rm(notesets_location)


# write data --------------------------------------------------------------

write_xlsx(
  df_location,
  paste0("data_wrangle/", "iati_location", ".xlsx")
  )



