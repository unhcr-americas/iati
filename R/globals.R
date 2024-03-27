# remotes::install_github("thinkr-open/checkhelper")
# checkhelper::print_globals()


globalVariables(unique(c(
  # show_donors: 
  "programmme_lab", "reporting_org_type_name", "transaction_type_name", "transaction_value_USD", "year",
  # show_earmarking: 
  "aid_type1_name", 
  # show_expenditure: 
  "aid_type1_name", 
  # show_indicators: 
  "actual", "gap_actual_target", "gap_color", "indicator_measure_name", "operation", "result_indicator_baseline_dimension_1", "result_indicator_baseline_dimension_2", "result_indicator_baseline_dimension_value_1", "result_indicator_baseline_dimension_value_2", "result_indicator_baseline_location_ref", "result_indicator_baseline_value", "result_indicator_target_value", "result_indicator_title", "result_title", "target", 
  # show_partnership: 
  "participating_org_eng", "participating_org_role_name", "participating_org_type_name", 
  # show_sectors: 
  "sector_desc", "sector_pct", "sector_vocabulary", "thiprogramme_lab",
  # show_budget_gap: 
  "budget_gap", "budget_value", "iati_identifier", "transaction_value", 
  # show_donors: 
  "provider_org_type_name", 
  # show_earmarking: 
  "earmarking_name", 
  # show_expenditure: 
  "asylum_seekers", "budget_value", "coa_name", "iati_identifier", "idps", "oip", "ooc", "refugees", "returned_idps", "returned_refugees", "stateless", "transaction_value", "weight", 
  # show_indicators: 
  "baseline", "deviation_actual_target", "deviation_color", "progress_baseline", "result_indicator_actual_value", "result_indicator_ascending", "result_indicator_target_value_1", 
  # show_partnership: 
  "Accountable", 
  # show_top_donors: 
  "transaction_provider_org",
  # show_sectors_rbm: 
  "sector_rbm", "sector_vocabulary_name", "year2",
  # show_goal_sdg: 
  "sdg", 
  # show_indicators: 
  "gap_green", "gap_orange", "gap_red", "threshold_green", "threshold_orange", "threshold_red", 
  # show_indicators_time: 
  "gap_green", "gap_orange", "gap_red", "threshold_green", "threshold_orange", "threshold_red", 
  # show_outcome_result: 
  "gap_green", "gap_orange", "gap_red", "result_type_name", "threshold_green", "threshold_orange", "threshold_red", 
  # show_transaction_flow: 
  "next_node", "next_x", "node", "x",
  # show_expenditure: 
  "commitment", "expenditure", 
  # show_outcome_result: 
  "transaction_value2",# compare_resource_result: 
  "indlevel", "iso3c", "result_indicator_actual_dimension_1", "result_indicator_actual_dimension_2", "result_indicator_actual_location_ref", "result_indicator_actual_value_1", "result_indicator_actual_value_2", "sector_code", "unhcr_region", "xmax", "xmin", "ymax", "ymin", 
  # show_indicators: 
  "result_indicator_actual_dimension_1", "result_indicator_actual_dimension_2", "result_indicator_actual_location_ref", "result_indicator_actual_value_1", "result_indicator_actual_value_2", 
  # show_indicators_time: 
  "result_indicator_actual_dimension_1", "result_indicator_actual_dimension_2", "result_indicator_actual_location_ref", "result_indicator_actual_value_1", "result_indicator_actual_value_2", 
  # show_outcome_result: 
  "result_indicator_actual_dimension_1", "result_indicator_actual_dimension_2", "result_indicator_actual_location_ref", "result_indicator_actual_value_1", "result_indicator_actual_value_2", 
  # show_transaction_flow: 
  "Earmarking", "Provider", "Type", "value", "Year"
)))