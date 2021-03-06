iati_default_aid_type <- function(xml_iati) {
# xml subset --------------------------------------------------------------

notesets_default_aid_type <- xml_iati %>% 
  xml_find_all('.//iati-activity/default-aid-type')


# extract data ------------------------------------------------------------
df_default_aid_type <- 
  map_dfr(notesets_default_aid_type, function(i) {
  tibble(
    iati_identifier = tryCatch(i |> xml_parent() |> xml_find_all("iati-identifier") |> xml_text(), error = function(e){ NA_character_}),
    default_aid_type_code = xml_attr_by_name(i, ".", "default-aid-type", "code"),
    default_aid_type_vocabulary = xml_attr_by_name(i, ".", "default-aid-type", "vocabulary")
  )
  
})

# remove unwanted objects -------------------------------------------------
rm(notesets_default_aid_type)


# write data --------------------------------------------------------------
write_xlsx(
  df_default_aid_type,
  paste0(folder_name, "/", "iati_default_aid_type", ".xlsx")
)

df_default_aid_type
}
