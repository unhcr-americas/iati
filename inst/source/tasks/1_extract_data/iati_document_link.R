iati_document_link <- function(xml_iati) {
# xml subset --------------------------------------------------------------
notesets_document_link <- xml_iati %>% 
  xml_find_all('.//iati-activity/document-link')


# extract data ------------------------------------------------------------
df_document_link <- map_dfr(notesets_document_link, function(i) {
  tibble(
    iati_identifier = tryCatch(i |> xml_parent() |> xml_find_all("iati-identifier") |> xml_text(), error = function(e){ NA_character_}),
    document_url = xml_attr_by_name(i, ".", "document-link", "url"),
    document_format = xml_attr_by_name(i, ".", "document-link", "format"),
    document_title =  xml_text_by_name(i, "./title", "title"),
    document_category_code = xml_attr_by_name(i, "./category", "category", "code"),
    document_language_code = xml_attr_by_name(i, "./language", "language", "code"),
    document_date = xml_attr_by_name(i, "./document-date", "document-date", "iso-date")
  )
  
})

# remove unwanted objects -------------------------------------------------
rm(notesets_document_link)


# write data --------------------------------------------------------------
write_xlsx(
  df_document_link,
  paste0(folder_name, "/", "iati_document_link", ".xlsx")
)

df_document_link
}
