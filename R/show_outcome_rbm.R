# WARNING - Generated by {fusen} from dev/dev_unhcr_programme.Rmd: do not edit by hand


#' show_outcome_rbm
#' 
#' @description  What are the most funded sectors per country based on new RBM framework.
#'   The activities that UNHCR plans and undertakes around the world are described
#'    under 16 "Outcome Areas".   
#' 
#' @param year A numeric value or a list of value.
#' @param programme_lab A character vector corresponding to the name of the programme.
#' @param iati_identifier_ops A character vector corresponding to the name of the operation.
#' @param ctr_name A character vector corresponding to the name of the country. 
#' 
#' @import ggplot2
#' @import dplyr
#' @import scales
#' @import unhcrthemes
#' @importFrom stats reorder
#'
#' @export 
#' @return  a graph
#' @examples
#' show_outcome_rbm( year =  c(  2020, 2021, 2022), 
#'              ctr_name = "Brazil")
show_outcome_rbm <- function(year, 
                         programme_lab = NULL, 
                         iati_identifier_ops = NULL, 
                         ctr_name = NULL ){
  # Check if only one argument is passed 
  if (!is.null(programme_lab) && !is.null(iati_identifier_ops)) {
    stop("Please pass only one of the arguments programme_lab or iati_identifier_ops.")
  } else if (!is.null(programme_lab) && !is.null(ctr_name)) {
    stop("Please pass only one of the arguments programme_lab or ctr_name.")
  } else if (!is.null(iati_identifier_ops) && !is.null(ctr_name)) {
    stop("Please pass only one of the arguments iati_identifier_ops or ctr_name.")
  }
  
  # Join dataActivity and dataSector on iati_identifier 
  df <- iati::dataSector |>
    dplyr::left_join(iati::dataActivity,  by = c("iati_identifier"))
  
  if (!is.null(programme_lab)) {
    thisprogramme_lab <- programme_lab
    thisyear <- year 
    df <- df |> 
      dplyr::mutate(year = factor(year)) |>
      dplyr::filter(programmme_lab == thiprogramme_lab &
            year %in% thisyear & 
            sector_vocabulary_name ==  "Reporting Organisation 2") |>
      dplyr::left_join(iati::mapping_sector, by= c("sector_desc"))
  } else if (!is.null(iati_identifier_ops)) {
    thisiati_identifier_ops <- iati_identifier_ops
    thisyear <- year 
    df <- df |> 
      dplyr::mutate(year = factor(year)) |>
      dplyr::filter(iati_identifier_ops == thisiati_identifier_ops &
            year %in%  thisyear & 
            sector_vocabulary_name ==  "Reporting Organisation 2") |>
      dplyr::left_join(iati::mapping_sector, by= c("sector_desc"))
  } else if (!is.null(ctr_name)) {
    thisctr_name <- ctr_name
    thisyear <- year 
    df <- df |> 
      dplyr::mutate(year = factor(year)) |>
      dplyr::filter(ctr_name == thisctr_name &
            year %in% thisyear & 
            sector_vocabulary_name == "Reporting Organisation 2") |>
      dplyr::left_join(iati::mapping_sector, by= c("sector_desc"))
  }
  
    if( nrow(df) == 0) {
      info <-  paste0("No resource allocation data available for \n",  
                              programme_lab, ctr_name,iati_identifier_ops, 
                      "\n by Outcome")
    p <- ggplot2::ggplot() +  
         ggplot2::annotate("text",  x = 1, y = 1, size = 4,
                            label = info ) +  
        ggplot2::theme_void()
    
  } else {
  
  df <- df |> 
    dplyr::group_by(sector_desc, sector_rbm, year) |> 
    dplyr::summarise(sector_pct = mean( as.numeric(sector_pct)) ) |> 
    dplyr::group_by( sector_rbm, year) |> 
    dplyr::summarise(sector_pct = sum(sector_pct, rm.na = TRUE))  |> 
   # dplyr::summarise(sector_pct = sum(sector_pct, na.rm = TRUE)/sum(df$sector_pct, na.rm = TRUE)*100) |> 
  #  top_n(5, wt = sector_pct) |> 
    dplyr::mutate(sector_rbm = as.factor(sector_rbm))
  
  
  ## Now joining budget & Expenditure to make the chart more informative...
   df_bud <-  iati::dataTransaction |> 
         dplyr::left_join(iati::dataActivity, by= c("iati_identifier"))  
  
  if (!is.null(programme_lab)) {
    thisprogramme_lab <- programme_lab
    thisyear <-  year 
   df_bud <- df_bud |> 
      # levels(as.factor(df$programmme_lab))
      dplyr::filter( programmme_lab == thisprogramme_lab &
            year  %in% thisyear & 
             transaction_type_name ==  "Expenditure")
  } else if (!is.null(iati_identifier_ops)) {
    thisiati_identifier_ops <- iati_identifier_ops
    thisyear <-  year 
   df_bud <- df_bud |> 
      dplyr::filter(iati_identifier_ops == thisiati_identifier_ops &
            year  %in% thisyear & 
             transaction_type_name ==  "Expenditure")
  } else if (!is.null(ctr_name)) {
    thisctr_name <- ctr_name
    thisyear <-  year 
    df_bud <- df_bud |> 
      dplyr::filter( ctr_name == thisctr_name &
            year    %in% thisyear & 
             transaction_type_name ==  "Expenditure")
  }
  
   df_bud2 <-  df_bud  |> 
        dplyr::group_by(iati_identifier, year) |>
        dplyr::summarise(transaction_value_USD = sum(transaction_value, na.rm = TRUE)) |>
        dplyr::left_join(iati::dataBudget |> 
                          dplyr::mutate(budget_value= as.numeric(budget_value)) |>
                          dplyr::group_by(iati_identifier) |>
                          dplyr::summarise(budget_value= sum(budget_value, na.rm = TRUE))  
                            , by= c("iati_identifier"))  |>
     dplyr::select(iati_identifier, year,budget_value,   transaction_value_USD ) |>
     dplyr::mutate( year2 = glue::glue('{year}  Bud:{scales::label_number(accuracy = .2, scale_cut = scales::cut_short_scale())(budget_value)}$  Exp:{scales::label_number(accuracy = .2, scale_cut = scales::cut_short_scale())(transaction_value_USD)}$  '))
   
   df <- df |>
         dplyr::left_join(df_bud2, by = c("year"))
   
  
## ## https://www.researchgate.net/publication/334894331_Polychrome_Creating_and_Assessing_Qualitative_Palettes_with_Many_Colors
#install.packages("Polychrome")
## Green-Armytage (2010) alphabet color - initially mapped - then corrected based on color mapping with SDG code
#GreenArmytage <- Polychrome::green.armytage.colors(16)
palette_outcome <- c("OA1: Access to Territory, Reg. and Documentation" ="#F0A3FF", 
                     "OA2: Status Determination" = "#C20088",
                     "OA3: Protection Policy and Law" = "#993F00", 
                     "OA4: Sexual and Gender-based Violence" = "#FF3A21", #  "#4C005C",
                     "OA5: Child Protection" =  "#FFCC99",
                     "OA6: Safety and Access to Justice" = "#00689D", # "#003380", 
                     "OA7: Community Engagement and Women's Empowerment"= "#94FFB5", 
                     "OA8: Well-Being and Basic Needs" =   "#e5243b",  # "#005C31", 
                     "OA9: Sustainable Housing and Settlements" = "#FD9D24", #  , 
                     "OA10: Healthy Lives" = "#4C9F38",  
                     "OA11: Education"= "#C5192D", #  ,  
                     "OA12: Clean Water, Sanitation and Hygiene"= "#26BDE2", # "#0075DC",
                     "OA13: Self Reliance, Economic Inclusion and Livelihoods" =  "#A21942", #  "#19A405",
                     "OA14: Voluntary Repatriation and Sustainable Reintegration"= "#9DCC00",
                     "OA15: Resettlement and Complementary Pathways" = "#191919", 
                     "OA16: Local Integration and other Local Solutions" =  "#2BCE48",
                     ## the enabling areas...
                     "EA17: Systems and Processes" ="#8F7C00",
                     "EA18: Operational Support and Supply Chain" = "#808080", 
                     "EA19: People and Culture" = "#FFA8BB",
                     "EA20: External Engagement and Resource Mobilization"= "#003380" )
   
   
   
  p <-  ggplot2::ggplot(data = df, 
                        ggplot2::aes(x = stats::reorder(sector_rbm, sector_pct),
                                 y = sector_pct,
                                 fill = sector_rbm,
                                 )) +
    
    ggplot2::geom_bar(stat = "identity") + # , fill = "#0072BC"
    ggplot2::coord_flip()+
    ggplot2::facet_wrap( ggplot2::vars(year2), 
                         labeller = ggplot2::labeller(year2 = ggplot2::label_wrap_gen(8))) +
    ggplot2::scale_fill_manual(values = palette_outcome,
                      drop = TRUE,
                      limits = force,
                      na.value = "grey50") +
    ggplot2::scale_y_continuous(expand = ggplot2::expansion(mult = c(0, .1)),
                                labels = scales::label_number(scale_cut = scales::cut_short_scale())) +
   # unhcrthemes::theme_unhcr(grid = TRUE, axis = "Y", axis_title = "Sector Percentage") +
    unhcrthemes::theme_unhcr(grid = "X", axis = "y", 
                             axis_title = "X",
                              legend = FALSE,
                             font_size = 18) +
    ggplot2::labs(title = "Resource Allocation per Outcome (%)", 
        subtitle = paste0("Recorded in ", programme_lab, ctr_name,iati_identifier_ops,
                          " based on UNHCR Results Framework "),          
         x = "Sectors", y = "% of Total Funding", 
         caption = "Source: Data published by UNHCR as part of the International Aid Transparency Initiative (IATI). UNHCR budget is needs-based. It represents the total amount of money that would be required were UNHCR to meet all of the needs that it is seeking to address.") 
  }
  
  return(p)
}
