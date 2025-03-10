library(rix)

rix(r_ver = "4.2.2",
    r_pkgs = c("targets", "tarchetypes", "rmarkdown"),
    system_pkgs = "pandoc",
    git_pkgs = list(
                 list(package_name = "housing",
                   repo_url = "https://github.com/rap4all/housing/",
                   branch_name = "fusen",
                   commit = "1c860959310b80e67c41f7bbdc3e84cef00df18e")
      ),
    ide = "other",
    shell_hook = "Rscript -e 'targets::tar_make()'",
    project_path = ".",
    overwrite = TRUE)
