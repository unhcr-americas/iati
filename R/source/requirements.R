if (!require("pacman")) install.packages("pacman")
if (!require("here")) install.packages("here")

pacman::p_load(tidyverse,
               xml2,
               svMisc,
               fs,
               furrr,
               writexl)
