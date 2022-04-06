

source_utf8 <- function(f) {
  l <- readLines(f, encoding="UTF-8")
  eval(parse(text=l),envir=.GlobalEnv)
}



xml_attr_by_name <-
  function(i, parent_name, node_name, attr_name, attr_position = 1L) {
    i =  i |> 
      xml_find_all(parent_name)
    
    x <- tryCatch(
      i[i |>
          xml_name() |>
          (\(x) which(x == node_name))() |> 
          nth(attr_position)] |>
        xml_attr(attr_name),
      error = function(e) {
        NA_character_
      }
    )
    
    if (rlang::is_empty(x) == TRUE) {
      x <- NA_character_
    } else {
      x
    }
    return(x)
  }



xml_child_attr_by_name <-
  function(i, node_name, attr_name, attr_position = 1L) {
    x <- tryCatch(
      i |> 
        xml_find_all(node_name) |> 
        xml_attr(attr_name) |> 
        nth(attr_position),
      error = function(e) {
        NA_character_
      }
    )
    
    if (rlang::is_empty(x) == TRUE) {
      x <- NA_character_
    } else {
      x
    }
    return(x)
  }


xml_text_by_name <-
  function(i, parent_name, node_name, attr_position = 1L) {
    i =  i |> 
      xml_find_all(parent_name)
    
    x <- tryCatch(
      i[i |> xml_name() |> (\(x) which(x == node_name))()|> 
          nth(attr_position)] |> xml_text(),
      error = function(e) {
        NA_character_
      }
    )
    
    if (rlang::is_empty(x) == TRUE) {
      x <- NA_character_
    } else {
      x
    }
    return(x)
  }


xml_text_by_lang <-
  function(i, parent_name, set_xml_name, language, attr_position = 1L) {
    i =  i |> 
      xml_find_all(parent_name)
    
    x <- tryCatch(
      (i |> xml_find_all(set_xml_name))[grep(language, i |>
                                               xml_contents() |>
                                               xml_attrs())|> 
                                          nth(attr_position)] |> 
        xml_text(),
      error = function(e) {
        NA_character_
      }
    )
    
    if (rlang::is_empty(x) == TRUE) {
      x <- NA_character_
    } else {
      x
    }
    return(x)
  }


