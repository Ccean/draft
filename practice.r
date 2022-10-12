pollutantmean <- function(directory, pollutant = "sulfate", id = 1:332) {
if(grep("specdata", directory) == 1) {
  directory <- ("./specdata/")
}
# initialize a vector to hold the pollutant data
mean_vector <- c()
# find all files in the specdata folder
all_files <- as.character( list.files(directory) )
file_paths <- paste(directory, all_files, sep="")
for(i in id) {
  current_file <- read.csv(file_paths[i], header=T, sep=",")
  head(current_file)
  pollutant
  na_removed <- current_file[!is.na(current_file[, pollutant]), pollutant]
  mean_vector <- c(mean_vector, na_removed)
}
result <- mean(mean_vector)
return(round(result, 3)) 
}


complete<-function(directory, id = 1:332) {
  if(grep("specdata", directory) == 1) {
    directory <- ("./specdata/")
  }
  # initialize a vector to hold the pollutant data
  mean_vector <- c()
  # find all files in the specdata folder
  all_files <- as.character( list.files(directory) )
  file_paths <- paste(directory, all_files, sep="")
  for(i in id) {
    current_file <- read.csv(file_paths[i], header=T, sep=",")
    na_removed <- complete.cases(current_file)
    nano_vector <- current_file[na_removed,]
    nano_vector$nobs<- nrow(nano_vector)
    mean_vector <- rbind(mean_vector, nano_vector)
  }
  result <- unique(data.frame(mean_vector$ID,mean_vector$nobs))
  return(result) 
}
