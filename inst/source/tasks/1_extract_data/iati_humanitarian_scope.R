iati_humanitarian_scope <- function(xml_iati) {
# xml subset --------------------------------------------------------------

notesets_humanitarian_scope <- xml_iati %>% 
  xml_find_all('.//iati-activity/humanitarian-scope')

# extract data ------------------------------------------------------------
df_humanitarian_scope <- map_dfr(notesets_humanitarian_scope, function(i) {
  tibble(
    iati_identifier = tryCatch(i |> xml_parent() |> xml_find_all("iati-identifier") |> xml_text(), error = function(e){ NA_character_}),
    humanitarian_scope_type = i |> xml_attr("type"),
    humanitarian_scope_vocabulary = i |> xml_attr("vocabulary"),
    humanitarian_scope_vocabulary_uri = i |> xml_attr("vocabulary-uri"),
    humanitarian_scope_code = i |> xml_attr("code"),
    humanitarian_scope_pct = i |> xml_attr("percentage"),
    humanitarian_scope_desc_eng = xml_text_by_lang(i, ".", 'narrative', "character\\(0\\)"),
    humanitarian_scope_desc_fr = xml_text_by_lang(i, ".", 'narrative', "^fr")
  )
  
})


# remove unwanted objects -------------------------------------------------
rm(notesets_humanitarian_scope)

# write data --------------------------------------------------------------
write_xlsx(
  df_humanitarian_scope,
  paste0(folder_name, "/", "iati_humanitarian_scope", ".xlsx")
)

df_humanitarian_scope
}
