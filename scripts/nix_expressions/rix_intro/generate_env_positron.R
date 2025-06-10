library(rix)

rix(date = "2025-06-09",
    r_pkgs = c("dplyr", "ggplot2"),
    py_conf = list(
      py_version = "3.13", 
      py_pkgs = c("polars", "scikit-learn")
    ),
    git_pkgs = NULL,
    tex_pkgs = NULL,
    ide = "positron",
    project_path = ".",
    overwrite = TRUE)
