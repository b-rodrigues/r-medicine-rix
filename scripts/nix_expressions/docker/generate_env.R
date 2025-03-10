library(rix)

rix(r_ver = "4.3.1",
    r_pkgs = c("dplyr", "ggplot2"),
    ide = "other",
    project_path = ".",
	shell_hook = "R",
    overwrite = TRUE)