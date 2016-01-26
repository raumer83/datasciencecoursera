pollutantmean <- function(directory, pollutant, id = 1:332) {
  #
  # Use case:
  #
  #   pollutantmean("~/Documents/sandbox/datasciencecoursera/specdata/",
  #                 "sulfate",
  #                 id = 1:10)

  # convert the numeric id to a 3 digit character string
  txtID = as.character(id)
  txtIDCharLength = nchar(txtID)
  txtID[txtIDCharLength == 1] = paste0("00",txtID[txtIDCharLength == 1])
  txtID[txtIDCharLength == 2] = paste0("0",txtID[txtIDCharLength == 2])

  # Do the initial read
  pollutantData  = read.csv(paste0(directory,txtID[1],".csv"))

  # loop over the rest of the ids and read in the data
  if (length(txtID) > 1) {
    for (i in 2:length(id)) {
      pollutantData  = rbind(pollutantData,
                             read.csv(paste0(directory,txtID[i], ".csv")))
    }
  }

  # compute the mean, remove NAs
  mean(pollutantData[,pollutant],na.rm = TRUE)
}
