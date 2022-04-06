
# xml subset --------------------------------------------------------------

notesets_indicator <- xml_iati %>% 
  xml_find_all('.//iati-activity/result/indicator') |> 
  map(xml_children)


# extract data ------------------------------------------------------------
df_result <- future_map_dfr(notesets_indicator, function(i) {
  tibble(
    iati_identifier = tryCatch(i|> xml_parent() |> xml_parent() |> xml_parent() |> xml_find_all("iati-identifier") |> xml_text(), error = function(e){ NA_character_}),
    result_type = tryCatch(i |> xml_parent() |> xml_parent() |> xml_attr("type"), error = function(e){ NA_character_}),
    result_aggregation_status = tryCatch(i |> xml_parent() |> xml_parent() |> xml_attr("aggregation-status"), error = function(e){ NA_character_}),
    result_title = i |>  xml_parent() |>  xml_parent() |> xml_find_first("title") |> xml_text(),
    result_desc = i |>  xml_parent() |>  xml_parent() |> xml_find_first("description") |> xml_text(),
    result_indicator_measure = i |>  xml_parent() |> xml_attr("measure"),
    result_indicator_title = xml_text_by_name(i, ".", "title"),
    result_indicator_desc = xml_text_by_name(i, ".", "description"),
    result_indicator_baseline_value = xml_attr_by_name(i, ".", "baseline", "value"),
    result_indicator_baseline_year = xml_attr_by_name(i, ".", "baseline", "year"),
    result_indicator_baseline_date = xml_attr_by_name(i, ".", "baseline", "iso-date"),
    result_indicator_baseline_location_ref = xml_child_attr_by_name(i, "location", "ref"),
    result_indicator_baseline_dimension_1 = xml_child_attr_by_name(i, "dimension", "name", 1),
    result_indicator_baseline_dimension_value_1 = xml_child_attr_by_name(i, "dimension", "value", 1),
    result_indicator_baseline_dimension_2 = xml_child_attr_by_name(i,"dimension", "name", 2),
    result_indicator_baseline_dimension_value_2 = xml_child_attr_by_name(i, "dimension", "value", 2),
    result_indicator_period_start = xml_attr_by_name(i, "period-start", "period-start", "iso-date"),
    result_indicator_period_end = xml_attr_by_name(i, "period-end", "period-end", "iso-date"),
    result_indicator_target_value = xml_attr_by_name(i, "target", "target", "value"),
    result_indicator_target_location_ref = xml_attr_by_name(i, "target/location", "location", "ref"),
    result_indicator_target_dimension_1 = xml_attr_by_name(i, "./target/dimension", "dimension", "name", 1),
    result_indicator_target_value_1 = xml_attr_by_name(i, "./target/dimension", "dimension", "value", 1),
    result_indicator_target_dimension_2 = xml_attr_by_name(i, "./target/dimension", "dimension", "name", 2),
    result_indicator_target_value_2 = xml_attr_by_name(i, "./target/dimension", "dimension", "value", 2)
  )
  
}, .progress = TRUE)


# remove unwanted objects -------------------------------------------------
rm(notesets_indicator)


# write data --------------------------------------------------------------

write_xlsx(
  df_result,
  paste0("data_wrangle/", "iati_result", ".xlsx")
  )


