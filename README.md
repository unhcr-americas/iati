# iati

## Objective

A data package with UNHCR contribution to the International Aid Transparency Initiative (IATI) that aims at:

 * reshaping IATI extraction from a complex xml file structure to a more user-friendly tabular format with necessary look-up code tables
 * offer easy to consume documentation on the data structure
 * provide built-in ggplot2 visualization, aka a "__chart library__" around high level key questions on UNHCR programme. Those visualizations can be integrated in Operation Situation Analysis or Protection Monitoring Analysis.

## Context 
UNHCR is committed to IATI: [https://reporting.unhcr.org/iati](https://reporting.unhcr.org/iati)

Extracting information from IATI can assist governments to plan and manage their budgets; parliamentarians and citizens to better hold governments accountable; community-based organisations to influence how resources are used; and journalists, researchers and activists to investigate the use and impact of the resources.

Information from Global Focus is translated monthly into the IATI open data standard and published using UNHCR’s IATI identifier: XM-DAC-41121.

Every UNHCR operation world-wide is reported on for each year from 2016. This includes financial information (budget, contributions, disbursements and expenditure), office locations, and results at various levels of activity. 

Activities for 2019 and onwards are be published as soon as possible after they become available. This current package is updated a much as possible.... 

## Install  

``` 
# With {remotes} using GitHub API
# install.packages("remotes")
remotes::install_github("unhcr-americas/iati")
```

## Contribute

This package is built with the help of [fusen package](https://thinkr-open.github.io/fusen/index.html) which allow to easily maintain consistent documentation through a single notebook. 

``` 
fusen::inflate(flat_file = "dev/flat_full.Rmd", vignette_name = "Get started")
```

