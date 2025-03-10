read_data <- function(data_name, package_name){

  temp <- new.env(parent = emptyenv())

  data(list = data_name,
       package = package_name,
       envir = temp)

  get(data_name, envir = temp)
}
