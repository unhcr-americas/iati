
# xml subset --------------------------------------------------------------
nodeset_activity <- xml_iati %>% 
  xml_find_all('.//iati-activity')


# extract data ------------------------------------------------------------
df_activity <- future_map_dfr(nodeset_activity, function(i) {
  tibble(
    iati_identifier = tryCatch(i  |> xml_find_all("iati-identifier") |> xml_text(), error = function(e){ NA_character_}),
    reporting_org =  xml_text_by_name(i, "reporting-org", "reporting-org"),
    reporting_org_ref =  xml_attr_by_name(i, "reporting-org", "reporting-org", "ref"),
    reporting_org_type = xml_attr_by_name(i, "reporting-org", "reporting-org", "type"),
    reporting_org_secondary_reporter  =  xml_attr_by_name(i, "reporting-org", "reporting-org", "secondary-reporter"),
    title_eng = xml_text_by_lang(i, "title", 'narrative', "character\\(0\\)"),
    title_fr = xml_text_by_lang(i, "title", 'narrative', "^fr"),
    title_es = xml_text_by_lang(i, "title", 'narrative', "^es"),
    title_zh = xml_text_by_lang(i, "title", 'narrative', "^zh"),
    title_ru = xml_text_by_lang(i, "title", 'narrative', "^ru"),
    title_ar = xml_text_by_lang(i, "title", 'narrative', "^ar"),
    description_type_1 = xml_attr_by_name(i, "description", "description", "type"),
    description_eng_1 = xml_text_by_lang(i, "description", 'narrative', "character\\(0\\)"),
    descriptionv_fr_1 = xml_text_by_lang(i, "description", 'narrative', "^fr"),
    # description_es_1 = xml_text_by_lang(i, "description", 'narrative', "^es"),
    # description_zh_1 = xml_text_by_lang(i, "description", 'narrative', "^zh"),
    # description_ru_1 = xml_text_by_lang(i, "description", 'narrative', "^ru"),
    # description_ar_1 = xml_text_by_lang(i, "description", 'narrative', "^ar"),
    description_type_2= xml_attr_by_name(i, "description", "description", "type", attr_position = 2L),
    description_eng_2 = xml_text_by_lang(i, "description", 'narrative', "character\\(0\\)", attr_position = 2L),
    descriptionv_fr_2 = xml_text_by_lang(i, "description", 'narrative', "^fr", attr_position = 2L),
    # description_es_2 = xml_text_by_lang(i, "description", 'narrative', "^es", attr_position = 2L),
    # description_zh_2 = xml_text_by_lang(i, "description", 'narrative', "^zh", attr_position = 2L),
    # description_ru_2 = xml_text_by_lang(i, "description", 'narrative', "^ru", attr_position = 2L),
    # description_ar_2 = xml_text_by_lang(i, "description", 'narrative', "^ar", attr_position = 2L),
    activity_status_code = xml_attr_by_name(i, "activity-status", "activity-status", "code"),
    activity_date_1 = xml_attr_by_name(i, "activity-date", "activity-date", "iso-date", 1),
    activity_date_type_1 = xml_attr_by_name(i, "activity-date", "activity-date", "type", 1),
    activity_date_2 = xml_attr_by_name(i, "activity-date", "activity-date", "iso-date", 2),
    activity_date_type_2 = xml_attr_by_name(i, "activity-date", "activity-date", "type", 2),
    activity_date_3 = xml_attr_by_name(i, "activity-date", "activity-date", "iso-date", 3),
    activity_date_type_3 = xml_attr_by_name(i, "activity-date", "activity-date", "type", 3),
    activity_date_4 = xml_attr_by_name(i, "activity-date", "activity-date", "iso-date", 4),
    activity_date_type_4 = xml_attr_by_name(i, "activity-date", "activity-date", "type", 4),
    # contact_info
    contact_info_type = xml_attr_by_name(i, "contact-info", "contact-info", "type"),
    contact_info_org = xml_text_by_name(i, ".//organisation", "organisation"),
    contact_info_email = xml_text_by_name(i, ".//email", "email"),
    contact_info_website = xml_text_by_name(i, ".//website", "website"),
    contact_info_mailing_address = xml_text_by_name(i, ".//mailing-address", "mailing-address"),
    activity_scope_code = xml_attr_by_name(i, "activity-scope", "activity-scope", "code"),
    recipient_country_code = xml_attr_by_name(i, "recipient-country", "recipient-country", "code"),
    recipient_country_pct = xml_attr_by_name(i, "recipient-country", "recipient-country", "percentage"),
    recipient_country =  xml_text_by_name(i, "recipient-country", "recipient-country"),
    recipient_region_code = xml_attr_by_name(i, "recipient-region", "recipient-region", "code"),
    recipient_region_vocabulary = xml_attr_by_name(i, "recipient-region", "recipient-region", "vocabulary"),
    recipient_region_vocabulary_url = xml_attr_by_name(i, "recipient-region", "recipient-region", "vocabulary-uri"),
    recipient_region_pct = xml_attr_by_name(i, "recipient-region", "recipient-region", "percentage"),
    recipient_region =  xml_text_by_name(i, "recipient-region", "recipient-region"),
    collaboration_type_code =  xml_attr_by_name(i, "collaboration-type", "collaboration-type", "code"),
    default_flow_type_code = xml_attr_by_name(i, "default-flow-type", "default-flow-type", "code"),
    default_finance_type_code = xml_attr_by_name(i, "default-finance-type", "default-finance-type", "code"),
    default_tied_status_code = xml_attr_by_name(i, "default-tied-status", "default-tied-status", "code"),
    capital_spend = xml_attr_by_name(i, "capital-spend", "capital-spend", "percentage")
  )
  
}, .progress = TRUE)


# remove unwanted objects -------------------------------------------------
rm(nodeset_activity)


# write data --------------------------------------------------------------
write_xlsx(df_activity,
           paste0("data_wrangle/", "iati_activity", ".xlsx"))

