library(rix)

rix(date = "2025-03-03",
    r_pkgs = c("dplyr", "ggplot2"),
    system_pkgs = c("python312", "python312Packages.pandas"),
    git_pkgs = NULL,
    tex_pkgs = NULL,
    ide = "positron",
    project_path = ".",
    overwrite = TRUE)
