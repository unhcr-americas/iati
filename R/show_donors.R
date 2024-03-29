# WARNING - Generated by {fusen} from dev/dev_unhcr_programme.Rmd: do not edit by hand

#' show_donors
#'
#' @description Who are the main donors by country in terms of transaction? 
#' 
#' @param year year to select starting from 2016 - could be one year or a list
#' @param programme_lab A character vector corresponding to the name of the programme.
#' @param iati_identifier_ops A character vector corresponding to the name of the operation.
#' @param ctr_name A character vector corresponding to the name of the country.
#' @param transaction_type_name Transaction type - default is "Incoming Commitment" ,
#'   can also be   "Disbursement", or "Expenditure"  
#' 
#' @import ggplot2
#' @import dplyr
#' @import scales
#' @import unhcrthemes
#'
#' @export 
#'
#' @return  a graph
#' @examples
#' knitr::kable(iati::dataTransaction |>
#'                 dplyr::select( transaction_type_name, transaction_type_description) |>
#'                 dplyr::distinct() )
#' show_donors(year = 2022,
#'            programme_lab = "The Americas",
#'            transaction_type_name = "Incoming Commitment" )
#' show_donors(year = c(2018, 2019,2020, 2021, 2022, 2023),
#'            ctr_name = "Brazil",
#'            transaction_type_name = "Incoming Commitment" )
#' show_donors(year = c(2018, 2019,2020, 2021, 2022, 2023),
#'            programme_lab = "Brazil",
#'            transaction_type_name = "Disbursement" )
#' show_donors(year = c(2018, 2019,2020, 2021, 2022, 2023),
#'            programme_lab = "Brazil",
#'            transaction_type_name = "Expenditure" )
show_donors <- function(year, 
                        programme_lab = NULL, 
                        iati_identifier_ops = NULL, 
                        ctr_name = NULL,
                        transaction_type_name = "Incoming Commitment"  ) {
  
  ## Check year is after or equal 2016
  
  
  # Check if only one argument is passed 
  if (!is.null(programme_lab) && !is.null(iati_identifier_ops)) {
    stop("Please pass only one of the arguments programme_lab or iati_identifier_ops.")
  } else if (!is.null(programme_lab) && !is.null(ctr_name)) {
    stop("Please pass only one of the arguments programme_lab or ctr_name.")
  } else if (!is.null(iati_identifier_ops) && !is.null(ctr_name)) {
    stop("Please pass only one of the arguments iati_identifier_ops or ctr_name.")
  }
  
  df <-  iati::dataTransaction |> 
         dplyr::left_join(iati::dataActivity, by= c("iati_identifier"))  
  
  ## Filtering
  if (!is.null(programme_lab)) {
    thisprogramme_lab <- programme_lab
    thisyear <-  year
    thistransaction_type_name <-  transaction_type_name
    df <- df |> 
      # levels(as.factor(df$programmme_lab))
      dplyr::filter( programmme_lab == thisprogramme_lab &
            year %in% thisyear & 
             transaction_type_name ==  thistransaction_type_name)
  } else if (!is.null(iati_identifier_ops)) {
    thisiati_identifier_ops <- iati_identifier_ops
    thisyear <-  year
    thistransaction_type_name <-  transaction_type_name
    df <- df |> 
      dplyr::filter(iati_identifier_ops == thisiati_identifier_ops &
            year %in% thisyear & 
             transaction_type_name ==  thistransaction_type_name)
  } else if (!is.null(ctr_name)) {
    thisctr_name <- ctr_name
    thisyear <-  year
    thistransaction_type_name <-  transaction_type_name
    df <- df |> 
      dplyr::filter( ctr_name == thisctr_name &
            year %in% thisyear & 
             transaction_type_name ==  thistransaction_type_name)
  }
   
 
  
  df1 <- df |> 
    dplyr::group_by(year, provider_org_type_name) |>
    dplyr::summarise( transaction_value_USD = sum(transaction_value_USD , na.rm = TRUE)) |>
    dplyr::mutate(provider_org_type_name = as.character(provider_org_type_name) )  |>
    dplyr::mutate(provider_org_type_name = as.factor(provider_org_type_name) ) 
  
  
    ## case there's no data at all
    if( nrow(df1) == 0) {
      info <-  paste0("No ", transaction_type_name, "\n  recorded   in ", 
                              programme_lab, ctr_name,iati_identifier_ops, "")
      p <- ggplot2::ggplot() +  
                     ggplot2::annotate("text",  x = 1, y = 1, size = 12,
                                          label = info ) +  
                     ggplot2::theme_void()
          
    } else if(nrow(df1)> 0) {
      
      
     p <- df1 |> 
    #  dplyr::filter(transaction_value_USD  <= 1000000 & transaction_value_USD  > 1000) |> 
      ggplot2::ggplot(ggplot2::aes(y = transaction_value_USD ,
                 x =  year,
                 fill = provider_org_type_name)) +
      ggplot2::geom_bar(alpha = 0.9, stat = "identity") +
      ggplot2::scale_fill_viridis_d(option = "inferno", na.value = "grey50") +
      ggplot2::scale_y_continuous(
        expand = ggplot2::expansion(mult = c(0, .1)),
        labels = scales::label_number(scale_cut = scales::cut_short_scale())  ) +
    #  scale_x_continuous(labels = scales::label_number(scale_cut = cut_short_scale())) +
     # ggplot2::facet_wrap(~ trans_year) +
      unhcrthemes::theme_unhcr(grid = "Y", axis = "X", axis_title = "X", font_size = 18)+
      ggplot2::labs(
        title = paste0(transaction_type_name," (in USD)"),
        subtitle = paste0("Recorded in ", programme_lab, ctr_name,iati_identifier_ops, " "),
        x = "",
        y = "",
        caption = "Source: Data published by UNHCR as part of the International Aid Transparency Initiative (IATI)" ) 
           }
 
  return(p)
}
