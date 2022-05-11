iati_participating_org <- function(xml_iati) {
# xml subset --------------------------------------------------------------
notesets_part_org <- xml_iati %>% 
  xml_find_all('.//iati-activity/participating-org')


# extract data ------------------------------------------------------------
df_participating_org <- map_dfr(notesets_part_org, function(i) {
  tibble(
    iati_identifier = tryCatch(i |> xml_parent() |> xml_find_all("iati-identifier") |> xml_text(), error = function(e){ NA_character_}),
    participating_org_eng = xml_text_by_name(i, 'narrative', "narrative", 1),
    participating_org_ref =  i |> xml_attr("ref"),
    participating_org_type = i |> xml_attr("type"),
    participating_org_role = i |> xml_attr("role"),
    participating_org_activity_id =  i |> xml_attr("activity-id"), 
    participating_org_crs_channel_code =  i |> xml_attr("crs-channel-code")
    )
})


# remove unwanted objects -------------------------------------------------
rm(notesets_part_org)


# write data --------------------------------------------------------------
write_xlsx(
  df_participating_org,
  paste0(folder_name, "/", "iati_participating_org", ".xlsx")
)

df_participating_org
}
