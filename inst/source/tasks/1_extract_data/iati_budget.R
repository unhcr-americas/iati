iati_budget <- function(xml_iati) {
# xml subset --------------------------------------------------------------

notesets_budget <- xml_iati %>% 
  xml_find_all('.//iati-activity/budget')


# extract data ------------------------------------------------------------
df_budget <- future_map_dfr(notesets_budget, function(i) {
  tibble(
    iati_identifier = tryCatch(i |> xml_parent() |> xml_find_all("iati-identifier") |> xml_text(), error = function(e){ NA_character_}),
    budget_type = xml_attr_by_name(i, ".", "budget", "type"),
    budget_status = xml_attr_by_name(i, ".", "budget", "status"),
    budget_period_start = xml_attr_by_name(i, "./period-start", "period-start", "iso-date"),
    budget_period_end = xml_attr_by_name(i, "./period-end", "period-end", "iso-date"),
    budget_currency = xml_attr_by_name(i, "./value", "value", "currency"),
    budget_value_date = xml_attr_by_name(i, "./value", "value", "value-date"),
    budget_value = xml_text_by_name(i, ".//value", "value")
  )}, .progress = TRUE)


# remove unwanted objects -------------------------------------------------
rm(notesets_budget)


# write data --------------------------------------------------------------
write_xlsx(df_budget,
           paste0(folder_name, "/", "iati_budget", ".xlsx"))


df_budget
}
