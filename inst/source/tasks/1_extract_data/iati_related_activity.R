iati_related_activity <- function(xml_iati) {
# xml subset --------------------------------------------------------------

notesets_related_activity <- xml_iati %>% 
  xml_find_all('.//iati-activity/related-activity')


# extract data ------------------------------------------------------------
df_related_activity <- map_dfr(notesets_related_activity, function(i) {
  tibble(
    iati_identifier = tryCatch(i |> xml_parent() |> xml_find_all("iati-identifier") |> xml_text(), error = function(e){ NA_character_}),
    related_activity_ref = xml_attr_by_name(i, ".", "related-activity", "ref"),
    related_activity_type = xml_attr_by_name(i, ".", "related-activity", "type")
  )
  
})


# remove unwanted objects -------------------------------------------------
rm(notesets_related_activity)


# write data --------------------------------------------------------------
write_xlsx(
  df_related_activity,
  paste0("data_wrangle/", "iati_related_activity", ".xlsx")
  )

df_related_activity
}
