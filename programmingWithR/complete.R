complete <- function(directory,id = 1:332) {
  #
  # Use case:
  #
  #   complete("~/Documents/sandbox/datasciencecoursera/specdata/",
  #                 c(2, 4, 8, 10, 12))
  #

  # convert the numeric id to a 3 digit character string
  txtID = as.character(id)
  txtIDCharLength = nchar(txtID)
  txtID[txtIDCharLength == 1] = paste0("00",txtID[txtIDCharLength == 1])
  txtID[txtIDCharLength == 2] = paste0("0",txtID[txtIDCharLength == 2])

  # Do the initial read
  d = data.frame(id = id[1])
  pollutantData  = read.csv(paste0(directory,txtID[1],".csv"))
  d$nobs = nrow(pollutantData[complete.cases(pollutantData),])

  # loop over the rest of the ids and read in the data
  if (length(txtID) > 1) {
    for (i in 2:length(id)) {
      pollutantData  = read.csv(paste0(directory,txtID[i],".csv"))
      d = rbind(d,
                c(id[i], nrow(pollutantData[complete.cases(pollutantData),]))
                )
    }
  }
 return(d)
}