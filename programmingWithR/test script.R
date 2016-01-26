source("~/Documents/sandbox/datasciencecoursera/programmingWithR/pollutantmean.R")
source("~/Documents/sandbox/datasciencecoursera/programmingWithR/complete.R")
source("~/Documents/sandbox/datasciencecoursera/programmingWithR/corr.R")


cr <- corr("~/Documents/sandbox/datasciencecoursera/specdata/")
# print(head(cr))
print(summary(cr))

pollutantmean("~/Documents/sandbox/datasciencecoursera/specdata/",
              "nitrate")

cc = complete("~/Documents/sandbox/datasciencecoursera/specdata/",
         54)
print(cc$nobs)


set.seed(42)
cc <- complete("~/Documents/sandbox/datasciencecoursera/specdata/", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])


cr <- corr("~/Documents/sandbox/datasciencecoursera/specdata/")
cr <- sort(cr)
set.seed(868)
out <- round(cr[sample(length(cr), 5)], 4)
print(out)


cr <- corr("~/Documents/sandbox/datasciencecoursera/specdata/", 129)
cr <- sort(cr)
n <- length(cr)
set.seed(197)
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)

cr <- corr("~/Documents/sandbox/datasciencecoursera/specdata/", 2000)
n <- length(cr)
cr <- corr("~/Documents/sandbox/datasciencecoursera/specdata/", 1000)
cr <- sort(cr)
print(c(n, round(cr, 4)))