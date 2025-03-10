library(targets)
library(tarchetypes)

tar_option_set(packages = "housing")

source("functions/read_data.R")

list(
  tar_target(
    commune_level_data,
    read_data("commune_level_data",
              "housing")
  ),

  tar_target(
    country_level_data,
    read_data("country_level_data",
              "housing")
  ),

  tar_target(
    commune_data,
    get_laspeyeres(commune_level_data)
  ),

  tar_target(
    country_data,
    get_laspeyeres(country_level_data)
  ),

  tar_target(
    communes,
    c("Luxembourg",
      "Mamer",
      "Wiltz",
      "Schengen",
      "Wincrange")
  ),

  tar_render(
    analyse_data,
    "analyse_data.Rmd"
  )

)
