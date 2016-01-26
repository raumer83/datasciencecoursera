corr <- function(directory,threshold = 0) {

  # read the files in the directory
  fileNames = dir(directory)

  # calculate cor(sulfate,nitrate) for monitors that pass the threshold
  mycor = vector(mode = "numeric",length = 0L)
  for (i in 1:length(fileNames)) {
    pollutantData  = read.csv(paste0(directory,fileNames[i]))
    pollutantData = pollutantData[complete.cases(pollutantData),]
    if (nrow(pollutantData) > threshold) {
      mycor = c(mycor, cor(pollutantData$sulfate, pollutantData$nitrate))
    }
  }


#   # loop over the rest of the ids and read in the data
#   if (length(txtID) > 1) {
#     for (i in 2:length(id)) {
#       pollutantData  = read.csv(paste0(directory,txtID[i],".csv"))
#       d = rbind(d,
#                 c(id[i], nrow(pollutantData[complete.cases(pollutantData),]))
#       )
#     }
#   }
  return(mycor)
}