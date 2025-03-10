library(targets)
library(tarchetypes)

list(
  tar_force(
    name = pres,
    command = quarto::quarto_render("index.qmd"),
    format = "file", 
    force = TRUE
  )
)
