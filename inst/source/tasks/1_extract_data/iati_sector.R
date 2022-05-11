iati_sector <- function(xml_iati) {
# xml subset --------------------------------------------------------------

notesets_sector <- xml_iati %>% 
  xml_find_all('.//iati-activity/sector')


# extract data ------------------------------------------------------------
df_sector <- map_dfr(notesets_sector, function(i) {
  tibble(
    iati_identifier = tryCatch(i |> xml_parent() |> xml_find_all("iati-identifier") |> xml_text(), error = function(e){ NA_character_}),
    sector_vocabulary = i |> xml_attr("vocabulary"),
    sector_vocabulary_uri = i |> xml_attr("vocabulary-uri"),
    sector_code = i |> xml_attr("code"),
    sector_pct = i |> xml_attr("percentage"),
    sector_desc = i |> xml_text()
  )
  
})


# remove unwanted objects -------------------------------------------------
rm(notesets_sector)


# write data --------------------------------------------------------------
write_xlsx(
  df_sector,
  paste0(folder_name, "/", "iati_sector", ".xlsx")
)

df_sector
}

