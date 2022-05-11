iati_transaction <- function(xml_iati) {
# xml subset --------------------------------------------------------------

notesets_location <- xml_iati %>% 
  xml_find_all('.//iati-activity/transaction') |> 
  map(xml_children)


# extract data ------------------------------------------------------------
df_transaction <- map_dfr(notesets_location, function(i) {
  tibble(
    iati_identifier = tryCatch(i |> xml_parent() |> xml_parent() |> xml_find_all("iati-identifier") |> xml_text(), error = function(e){ NA_character_}),
    transaction_ref = tryCatch(i |> xml_parent() |> xml_attr("ref"), error = function(e){ NA_character_}),
    transaction_humanitarian = tryCatch(i |> xml_parent() |> xml_attr("humanitarian"), error = function(e){ NA_character_}),
    transaction_type_code = xml_attr_by_name(i, ".", "transaction-type", "code"),
    transaction_date = xml_attr_by_name(i, ".", "transaction-date", "iso-date"),
    transaction_value_currency = xml_attr_by_name(i, ".", "value", "currency"),
    transaction_value_date = xml_attr_by_name(i, ".", "value", "value-date"),
    transaction_value = xml_text_by_name(i, ".", "value"),
    transaction_description = xml_text_by_name(i, ".", "description"),
    transaction_provider_org_type = xml_attr_by_name(i, ".", "provider-org", "type"),
    transaction_provider_org_ref = xml_attr_by_name(i, ".", "provider-org", "ref"),
    transaction_provider_org = xml_text_by_name(i, ".", "provider-org"),
    transaction_aid_type_code_1 = xml_attr_by_name(i, ".", "aid-type", "code", 1),
    transaction_aid_type_vocabulary_1 = xml_attr_by_name(i, ".", "aid-type", "vocabulary", 1),
    transaction_aid_type_code_2 = xml_attr_by_name(i, ".", "aid-type", "code", 2),
    transaction_aid_type_vocabulary_2 = xml_attr_by_name(i, ".", "aid-type", "vocabulary", 2),
    transaction_value_USD = xml_text_by_name(i, ".", "value-USD")
    )
  
})


# remove unwanted objects -------------------------------------------------
rm(notesets_location)


# write data --------------------------------------------------------------
write_xlsx(
  df_transaction,
  paste0(folder_name, "/", "iati_transaction", ".xlsx")
)

df_transaction
}
